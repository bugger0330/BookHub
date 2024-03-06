package com.library.bookhub.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class ChatService {

    private static final String SECRET_KEY = "bklycURxUEx4UHZ3cVVHZnByZkh0ZXFtRmdhWkhnc1g=";
    private static final String API_URL = "https://kcpx5bed4n.apigw.ntruss.com/custom/v1/13590/0ccf23d5f7cd54a2c0653ebe8d42ee0a84e4d9b42d0c2fc0278357f361cb202e";

    public String sendMessage(String chatMessage) throws IOException {
        URL url = new URL(API_URL);
        String message = getReqMessage(chatMessage);
        String encodeBase64String = makeSignature(message, SECRET_KEY);

        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json;UTF-8");
        con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.write(message.getBytes("UTF-8"));
        wr.flush();
        wr.close();

        return getResponse(con);
    }

    private String makeSignature(String message, String secretKey) {
        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");
            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.encodeBase64String(rawHmac);

            return encodeBase64String;

        } catch (Exception e){
            e.printStackTrace();
            return encodeBase64String;
        }
    }


    private String getReqMessage(String voiceMessage) {
        JSONObject obj = new JSONObject();
        long timestamp = new Date().getTime();
        obj.put("version", "v2");
        obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
        obj.put("timestamp", timestamp);

        JSONObject bubbles_obj = new JSONObject();
        bubbles_obj.put("type", "text");
        JSONObject data_obj = new JSONObject();
        data_obj.put("description", voiceMessage);
        bubbles_obj.put("type", "text");
        bubbles_obj.put("data", data_obj);

        JSONArray bubbles_array = new JSONArray();
        bubbles_array.add(bubbles_obj);

        obj.put("bubbles", bubbles_array);
        obj.put("event", "send");

        return obj.toString();
    }

    private String getResponse(HttpURLConnection con) throws IOException {
        int responseCode = con.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();

            return parseResponse(response.toString());
        } else {
            return con.getResponseMessage();
        }
    }

    private String parseResponse(String jsonResponse) {
        try {
            JSONParser jsonparser = new JSONParser();
            JSONObject json = (JSONObject) jsonparser.parse(jsonResponse);
            JSONArray bubblesArray = (JSONArray) json.get("bubbles");
            JSONObject bubbles = (JSONObject) bubblesArray.get(0);
            JSONObject data = (JSONObject) bubbles.get("data");
            return (String) data.get("description");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error parsing response";
        }
    }
}

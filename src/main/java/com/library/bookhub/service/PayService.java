package com.library.bookhub.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;

import com.library.bookhub.repository.UserPointRepository;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.web.dto.CancelRequest;

import jakarta.mail.internet.ParseException;
import lombok.extern.slf4j.Slf4j;


/**
 * 결제 서비스
 * @Author : 이준혁
 */
@Service
@Slf4j
public class PayService {
	
	@Autowired
	private UserPointService userPointService;
	
	@Autowired
	private UserService userService;


	@Autowired
	private UserPointRepository userPointRepository;
	
	  public ResponseEntity<String> getToken() {
	        // IAMPORT API의 엑세스 키와 시크릿 키
	        String impKey = "0841453800077355";
	        String impSecret = "C38QY15T52YeFEBht7KMGKz9Dia5mTAluKtRwp4XV1rmkY6bIYWfvHXjoGYXcK4i5EuI4C3cM9nndmx7";

	        // IAMPORT API 요청 URL
	        String apiUrl = "https://api.iamport.kr/users/getToken";

	        // IAMPORT API 요청 시 전송할 데이터
	        String requestData = "{\"imp_key\": \"" + impKey + "\", \"imp_secret\": \"" + impSecret + "\"}";

	        // RestTemplate을 사용하여 POST 요청 보내기
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        HttpEntity<String> requestEntity = new HttpEntity<>(requestData, headers);

	        // 요청 보내기
	        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);

	        // 토큰 값을 로그로 출력
	        log.info("토큰 값: {}", responseEntity.getBody());
	        return responseEntity;
	    }


		// 환불요청
		@Transactional
		public ResponseEntity<String> cancelPayment(String impUid, int price, String accessToken) {

		   UserPoint userPoint = new UserPoint();

			String apiUrl = "https://api.iamport.kr/payments/cancel";
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", accessToken);

			ObjectMapper objectMapper = new ObjectMapper();
			String requestData;
			try {
				Map<String, Object> requestBody = new HashMap<>();
				requestBody.put("reason", "고객 요청 환불");
				requestBody.put("imp_uid", impUid);
				requestBody.put("amount", price);
				requestBody.put("checksum", price);
				requestData = objectMapper.writeValueAsString(requestBody);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to process request.");
			}
			HttpEntity<String> requestEntity = new HttpEntity<>(requestData, headers);

			try {
				ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
				System.out.println("Response Body: " + response.getBody()); // 로그 추가


				return response;
			} catch (HttpClientErrorException e) {
				HttpStatus statusCode = (HttpStatus) e.getStatusCode();
				String responseBody = e.getResponseBodyAsString();
				System.out.println("HTTP 오류 코드: " + statusCode);
				System.out.println("응답 본문: " + responseBody);
				if (responseBody != null) {
					return new ResponseEntity<>(responseBody, statusCode);
				} else {
					return new ResponseEntity<>(statusCode);
				}
			}
		}

}

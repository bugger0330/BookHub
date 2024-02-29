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



@Service
@Slf4j
public class PayService {
	
	@Autowired
	private UserPointService userPointService;
	
	@Autowired
	private UserService userService;
	
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
	  
	  
	  public ResponseEntity<String> cancelPayment(UserPoint userPoint, String accessToken) {
		    List<UserPoint> list = userPointService.refundReq();
		    String apiUrl = "https://api.iamport.kr/payments/cancel";
		    RestTemplate restTemplate = new RestTemplate();
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);
		    headers.set("Authorization", accessToken);
		    log.info("취소 요청 imp_uid: {}", userPoint.getId()); // imp_uid 로그 추가

		    for (UserPoint userPointItem : list) {
		        String impUid = userPointItem.getImpUid();
		        Integer price = userPointItem.getPrice();

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
		            // JSON 변환 오류 처리
		            e.printStackTrace(); // 또는 로깅 등의 적절한 처리
		            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to process request.");
		        }
		        HttpEntity<String> requestEntity = new HttpEntity<>(requestData, headers);

		        try {
		            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
		            System.out.println("Response Body: " + response.getBody()); // 로그 추가
		            // 처리 결과에 따른 추가 작업 수행 가능
		        } catch (HttpClientErrorException e) {
		            // HttpClientErrorException 처리
		        	HttpStatus statusCode = (HttpStatus) e.getStatusCode();
		            // 에러 상태 코드와 응답 본문을 로깅
		            String responseBody = e.getResponseBodyAsString();
		            System.out.println("HTTP 오류 코드: " + statusCode);
		            System.out.println("응답 본문: " + responseBody);
		            // 클라이언트에게 HTTP 오류 코드와 응답 본문을 반환
		            if (responseBody != null) {
		                return new ResponseEntity<>(responseBody, statusCode);
		            } else {
		                return new ResponseEntity<>(statusCode);
		            }
		        }
		    }

		    // 모든 요청이 성공했을 경우 성공 응답 반환
		    return ResponseEntity.ok("All payments canceled successfully.");
		}


}

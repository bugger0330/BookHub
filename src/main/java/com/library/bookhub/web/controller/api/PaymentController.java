<<<<<<< HEAD
package com.library.bookhub.web.controller.api;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.SubscriptionProduct;
import com.library.bookhub.service.SubscriptionProductService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Optional;
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private SubscriptionProductService subscriptionProductService;
	
	
	// 구독 상품 내역 보내기
	 @GetMapping("/detail/{id}")
	    public String detailProduct(@PathVariable int id, Model model) {
	        // 서비스 상세조회 함수 호출
	        Optional<SubscriptionProduct> optionalProduct = subscriptionProductService.findByProductId(id);
	        // jsp 전달
	        model.addAttribute("product", optionalProduct.get());
	        return "pages/payment/paymentTest";
	    }
	  

	  
}
=======
package com.library.bookhub.web.controller.api;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
@Controller
public class PaymentController {
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	  @RequestMapping(value = "/confirm")
	  public ResponseEntity<JSONObject> confirmPayment(@RequestBody String jsonBody) throws Exception {
	    
	    JSONParser parser = new JSONParser();
	    String orderId;
	    String amount;
	    String paymentKey;
	    try {
	      // 클라이언트에서 받은 JSON 요청 바디입니다.
	      JSONObject requestData = (JSONObject) parser.parse(jsonBody);
	      paymentKey = (String) requestData.get("paymentKey");
	      orderId = (String) requestData.get("orderId");
	      amount = (String) requestData.get("amount");
	    } catch (ParseException e) {
	      throw new RuntimeException(e);
	    };
	    JSONObject obj = new JSONObject();
	    obj.put("orderId", orderId);
	    obj.put("amount", amount);
	    obj.put("paymentKey", paymentKey);
	    
	    // 토스페이먼츠 API는 시크릿 키를 사용자 ID로 사용하고, 비밀번호는 사용하지 않습니다.
	    // 비밀번호가 없다는 것을 알리기 위해 시크릿 키 뒤에 콜론을 추가합니다.
	    String widgetSecretKey = "test_sk_d46qopOB897Y06P4v2zLVZmM75y0";
	    Base64.Encoder encoder = Base64.getEncoder();
	    byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes("UTF-8"));
	    String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
	    
	    // 결제를 승인하면 결제수단에서 금액이 차감돼요.
	    URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	    connection.setRequestProperty("Authorization", authorizations);
	    connection.setRequestProperty("Content-Type", "application/json");
	    connection.setRequestMethod("POST");
	    connection.setDoOutput(true);
	    
	    OutputStream outputStream = connection.getOutputStream();
	    outputStream.write(obj.toString().getBytes("UTF-8"));
	    
	    int code = connection.getResponseCode();
	    boolean isSuccess = code == 200 ? true : false;
	    
	    InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
	    
	    // 결제 성공 및 실패 비즈니스 로직을 구현하세요.
	    Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	    JSONObject jsonObject = (JSONObject) parser.parse(reader);
	    responseStream.close();
	    
	    return ResponseEntity.status(code).body(jsonObject);
	    
	  }
	  

}
>>>>>>> a77da8328c350a77426501a3d67927f60f94bf64

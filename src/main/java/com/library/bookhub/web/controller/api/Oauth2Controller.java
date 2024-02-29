package com.library.bookhub.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.security.oauth.SessionUser;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class Oauth2Controller {
	
	
	/////////////////////////////////////////////
	// 테스트 컨트롤러(소셜 로그인 유저 정보 조회)
	/////////////////////////////////////////////
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/auth/test")
	public String oauth2() {
		
		SessionUser data = (SessionUser) httpSession.getAttribute("user");
		
		log.info("data : "+data.toString());
		log.info("email : "+data.getEmail());
		
		/*
	        Map<String, Object> kakaoAccount = (Map<String, Object>) json.get("kakao_account");
	        String email = (String) kakaoAccount.get("email");
			
	        log.info("user : "+user);
	        log.info("json : "+json);
	        log.info("kakaoAccount : "+kakaoAccount);
	        log.info("email : "+email);
	        
	        
        
        */
		return data.toString();
	}
}
 
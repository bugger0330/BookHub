package com.library.bookhub.web.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.library.bookhub.entity.User;
import com.library.bookhub.security.SecurityUserService;
import com.library.bookhub.service.MemberService;
import com.library.bookhub.web.dto.member.KakaoProfile;
import com.library.bookhub.web.dto.member.OauthToken;
import com.library.bookhub.web.dto.member.SocialSignUpDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SocialUserController {
	
	// 카카오 Rest Key
	@Value("${spring.security.oauth2.client.registration.kakao.client-id}")
	private String KakaoRestKey;
	
	// 카카오 리다이렉트 uri
	@Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
	private String KakaoRedirectUri;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private SecurityUserService securityUserService;
	
	// 카카오 인가 권한
	// 카카오 로그인
	// http://localhost:80/user/kakao-callback?code=
	@GetMapping("/kakao")
	public int kakaoCallback(@RequestParam("code") String code) {
		
		// POST 방식,  Header 구성, body 구성
		RestTemplate rt1 = new RestTemplate();

		// 헤더 구성
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// body 구성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code"); // 카카오 디벨로퍼에서 복사
		params.add("client_id", KakaoRestKey);
		params.add("redirect_uri", KakaoRedirectUri);
		params.add("code", code);
		
		log.info("code :"+ code);
		log.info("client_id :"+ KakaoRestKey);
		log.info("redirect_uri :"+ KakaoRedirectUri);
		
		// 헤더 + 바디 결합
		HttpEntity<MultiValueMap<String, String>> reqMsg
			= new HttpEntity<>(params, headers1);
		
		ResponseEntity<OauthToken> response =  rt1.exchange("https://kauth.kakao.com/oauth/token", 
				HttpMethod.POST, reqMsg, OauthToken.class);
		
		// 다시 요청 -- 인증 토큰 -- 사용자 정보 요청
		RestTemplate rt2 = new RestTemplate();
		
		// 헤더
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+ response.getBody().getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 바디 x
		// 결합 --> 요청
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);
		ResponseEntity<KakaoProfile> response2 = 
				rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoInfo, KakaoProfile.class);
		
		log.info(kakaoInfo.toString());
		log.info(response2.getBody().toString());
		
		KakaoProfile kakaoProfile = response2.getBody();
		
		SocialSignUpDto dto = SocialSignUpDto.builder()
				.uid(kakaoProfile.getKakaoAccount().getEmail())
				.name(kakaoProfile.getProperties().getNickname())
				.email(kakaoProfile.getKakaoAccount().getEmail())
				.password("bookHubKakao북허브")
				.social("kakao")
				.build();
		
		log.info("SocialSignUpDto :"+dto);
		log.info("SocialSignUpDto :"+dto.getUid());
		
		User user = new User();
		
		user = service.readUserByUserName(dto.getUid());
		if(user == null) {
			service.createSocialUser(dto);
		}
		
		// 시큐리티 연결
		securityUserService.loadUserByUsername(user.getUserName());
		
		return 0;
	}
	
	
	
	// 네이버 로그인
	// 구글 로그인
	
}

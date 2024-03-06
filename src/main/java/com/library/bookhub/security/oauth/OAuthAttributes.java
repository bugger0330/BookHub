package com.library.bookhub.security.oauth;

import java.util.Map;
import java.util.UUID;

import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class OAuthAttributes {
	private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String username;
    private String password;
    private String nickname;
    private String email;
    private String phone;
    
    // 오스 이메일 가입자의 비밀번호 생성
    private static int randomNumber = (int) (Math.random() * 100000000);
    private static UUID uuPass = new UUID(0, randomNumber);
    
    
    @Builder
    public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey, 
    						String username,String nickname, String email, String password, String phone) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.email = email;
        this.phone = phone;
    }
    
    // 소셜 구분 및 정보 분배
    public static OAuthAttributes of(String registrationId, String userNameAttributeName,Map<String, Object> attributes) {
        if ("kakao".equals(registrationId)) {
            return ofKakao(userNameAttributeName, attributes);
        }
        if ("naver".equals(registrationId)) {
        	return ofNaver(userNameAttributeName, attributes);
        }
        if ("google".equals(registrationId)) {
        	return ofGoogle(userNameAttributeName, attributes);
        }
        return null;
    }
    
    // kakao 데이터
    private static OAuthAttributes ofKakao(String userNameAttributeName,Map<String, Object> attributes) {
    	
    	log.info("=========== OAuthAttributes ===========");
    	log.info("OAuthAttributes attributes id : "+attributes);
		log.info("OAuthAttributes attributes id : "+attributes.get("id"));
		log.info("OAuthAttributes attributes kakao_account : "+attributes.get("kakao_account"));
		log.info("=========== end ===========");
		
		Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
	    Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
	    
	    log.info("=========== kakaoAccount,profile  ===========");
	    log.info("kakaoAccount :"+kakaoAccount);
	    log.info("profile :"+profile);
	    log.info("=========== end ===========");
		
	    String nickname = (String) profile.get("nickname");
        String email = (String) kakaoAccount.get("email");
        String username = email;
        
        
        
        log.info("=========== kakaoAccount,profile  ===========");
	    log.info("nickname :"+nickname);
	    log.info("email :"+email);
	    log.info("username :"+username);
	    log.info("=========== end ===========");

        return OAuthAttributes.builder()
                .nickname(nickname)
                .email("kakao_"+email)
                .username(username)
                .password(uuPass.toString())
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }
    
    // naver 데이터
    private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        log.info("=========== OAuthAttributes ===========");
        log.info("OAuthAttributes attributes id : " + attributes);
        log.info("=========== end ===========");
        
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        
        log.info("=========== response  ===========");
	    log.info("response :"+response);
	    log.info("=========== end ===========");
        
        String email = (String) response.get("email");
        String name = (String) response.get("name");
        String phone = (String) response.get("mobile");

        String username = email;

        log.info("=========== naver data  ===========");
	    log.info("email :"+email);
	    log.info("name :"+name);
	    log.info("phone :"+phone);
	    log.info("username :"+username);
	    log.info("=========== end ===========");
        
        
		  return OAuthAttributes.builder()
				  .email("naver_" + email)
				  .nickname(name)
				  .username(username) 
				  .password(uuPass.toString()) 
				  .attributes(attributes)
				  .nameAttributeKey(userNameAttributeName)
				  .phone(phone) 
				  .build();
		 
    }
    
    // google 데이터
    private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
        
    	String email = (String) attributes.get("email");
        String name = (String) attributes.get("name");
    	
        log.info("=========== naver data  ===========");
	    log.info("email :"+email);
	    log.info("name :"+name);
	    log.info("=========== end ===========");
        
    	String username =  email;
        
        return OAuthAttributes.builder()
               .nickname(name)
               .email("google_"+email)
               .username(username)
               .password(uuPass.toString())
               .attributes(attributes)
               .nameAttributeKey(userNameAttributeName)
               .build();
		 
    }
    
}

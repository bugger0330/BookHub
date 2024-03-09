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
    private String role;
    
    // 오스 이메일 가입자의 비밀번호 생성
    private static int randomNumber = (int) (Math.random() * 100000000);
    private static UUID uuPass = new UUID(0, randomNumber);
    
    
    @Builder
    public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey, 
    						String username,String nickname, String email, String password, String phone, String role) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.email = email;
        this.phone = phone;
        this.role = role;
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
		
		Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
	    Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
		
	    String nickname = (String) profile.get("nickname");
        String email = (String) kakaoAccount.get("email");
        String username = email;
        
        return OAuthAttributes.builder()
                .nickname(nickname)
                .email("kakao_"+email)
                .username(username)
                .password(uuPass.toString())
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .role("ROLE_USER")
                .build();
    }
    
    // naver 데이터
    private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        
        String email = (String) response.get("email");
        String name = (String) response.get("name");
        String phone = (String) response.get("mobile");

        String username = email;

		  return OAuthAttributes.builder()
				  .email("naver_" + email)
				  .nickname(name)
				  .username(username) 
				  .password(uuPass.toString()) 
				  .attributes(attributes)
				  .nameAttributeKey(userNameAttributeName)
				  .phone(phone) 
				  .role("ROLE_USER")
				  .build();
		 
    }
    
    // google 데이터
    private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
        
    	String email = (String) attributes.get("email");
        String name = (String) attributes.get("name");
    	
        
    	String username =  email;
        
        return OAuthAttributes.builder()
               .nickname(name)
               .email("google_"+email)
               .username(username)
               .password(uuPass.toString())
               .attributes(attributes)
               .nameAttributeKey(userNameAttributeName)
               .role("ROLE_USER")
               .build();
		 
    }
    
}

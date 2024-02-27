package com.library.bookhub.security.oauth;

import java.util.Map;

import com.library.bookhub.entity.User;

import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class OAuthAttributes {
	private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String username;
    private String nickname;
    private String email;
    

    @Builder
    public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey, String username,String nickname, String email) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.username = username;
        this.nickname = nickname;
        this.email = email;
    }
    
    // 소셜 구분
    public static OAuthAttributes of(String registrationId, Map<String, Object> attributes) {
        if ("kakao".equals(registrationId)) {
            return ofKakao(attributes);
        }
        // 다른 등록 ID를 처리할 필요가 있으면 여기서 처리합니다.
        return null;
    }
    
    private static OAuthAttributes ofKakao(Map<String, Object> attributes) {
    	log.info("=========== OAuthAttributes ===========");
    	log.info("OAuthAttributes attributes id : "+attributes);
		log.info("OAuthAttributes attributes id : "+attributes.get("id"));
		log.info("OAuthAttributes attributes kakao_account : "+attributes.get("kakao_account"));
		log.info("=========== end ===========");
		
		
        return null;
        
        /*
         *return OAuthAttributes.builder()
                .nickname((String) profile.get("nickname"))
                .email((String) kakaoAccount.get("email"))
                .username("kakao_" + kakaoAccount.get("email"))
                .build();

         * 
         * */
    }
    
    public User toEntity() {
        return User.builder()
                .name(nickname)
                .email(email)
                .role("ROLE_USER")
                .userName("Kakao_")
                .build();
    }

}

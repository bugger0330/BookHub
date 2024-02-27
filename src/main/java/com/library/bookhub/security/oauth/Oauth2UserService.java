package com.library.bookhub.security.oauth;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.User;
import com.library.bookhub.repository.MemberRepository;
import com.library.bookhub.web.dto.member.KakaoUserInfo;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class Oauth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    
    private final HttpSession httpSession;
    private final MemberRepository memberRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        log.info("Oauth2UserService=================== start");
        
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);
        log.info("1..oAuth2User : "+oAuth2User);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        log.info("2..registrationId : "+registrationId);
        
        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
        log.info("3..userNameAttributeName : "+userNameAttributeName);
        
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, oAuth2User.getAttributes());
        log.info("4..attributes : "+attributes);
        
        User user = saveOrUpdate(attributes);

        httpSession.setAttribute("user", new SessionUser(user));

        return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority(user.getRole())),
                attributes.getAttributes(),
                attributes.getNameAttributeKey());
    }

    // 소셜 등록 or 조회
    private User saveOrUpdate(OAuthAttributes attributes) {
    	log.info("saveOrUpdate - attributes : "+attributes.toString());
        User userEntity = memberRepository.findByUsername(attributes.getEmail());
        
        if(userEntity == null) {
            // 새로운 사용자 등록 로직 추가
        	userEntity = new User();
            userEntity.setUserName(attributes.getUsername());
            userEntity.setName(attributes.getNickname());
            userEntity.setEmail(attributes.getEmail());
            userEntity.setRole("ROLE_USER");
            
        	memberRepository.insert(userEntity);
        }
        log.info("saveOrUpdate user : "+userEntity.toString());

        return userEntity;
    }
    
}
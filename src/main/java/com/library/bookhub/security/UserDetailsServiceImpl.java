package com.library.bookhub.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.library.bookhub.security.oauth.SessionUser;

import jakarta.servlet.http.HttpSession;

@Service
public class UserDetailsServiceImpl {
	
	private final HttpSession httpSession;

    public UserDetailsServiceImpl(HttpSession httpSession) {
        this.httpSession = httpSession;
    }
    
    // 아이디 구분
    public String getUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
        	if (authentication.getPrincipal() instanceof OAuth2User) {
        		SessionUser oauth2User = (SessionUser) httpSession.getAttribute("user");
                return oauth2User.getUsername();
            } else {
                return authentication.getName(); // 일반 회원 유저의 아이디
            }
        }
        return null;
    }
}

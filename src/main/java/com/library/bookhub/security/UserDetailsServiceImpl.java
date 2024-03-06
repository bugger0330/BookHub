package com.library.bookhub.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
            if (authentication.getPrincipal() instanceof SessionUser) {
                SessionUser sessionUser = (SessionUser) authentication.getPrincipal();
                return sessionUser.getUsername(); // 소셜 로그인 사용자의 아이디
            } else {
                return authentication.getName(); // 일반 회원 유저의 아이디
            }
        }
        return null;
    }
}

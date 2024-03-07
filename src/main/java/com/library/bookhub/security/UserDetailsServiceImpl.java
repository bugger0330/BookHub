package com.library.bookhub.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.library.bookhub.security.oauth.SessionUser;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	        Object principal = authentication.getPrincipal();
	        if (principal instanceof MyUserDetails) {
	            // 일반 로그인 사용자인 경우
	            MyUserDetails userDetails = (MyUserDetails) principal;
	            return userDetails.getUsername(); // 일반 로그인 사용자의 아이디
	        } else {
	            // 소셜 로그인 사용자인 경우
	        	SessionUser oauth2User = (SessionUser) httpSession.getAttribute("user");
                return oauth2User.getUsername(); // 소셜 로그인 사용자의 고유 식별자
	        }
	    }
	    return null;
    }
}

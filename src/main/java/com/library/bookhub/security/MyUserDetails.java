package com.library.bookhub.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.library.bookhub.entity.User;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@Builder
@ToString
public class MyUserDetails implements UserDetails, OAuth2User  {
	
	private User user;
	private Map<String, Object> attributes;
	
	private boolean isOAuthUser;
	
	// 일반 로그인
	public MyUserDetails(User user) {
        this.user = user;
        this.isOAuthUser = false;
    }
	
	// OAuth2 로그인 생성자
    public MyUserDetails(User user, Map<String, Object> attributes, boolean isOAuthUser) {
        this.user = user;
        this.attributes = attributes;
        this.isOAuthUser = true;
    }
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		if(!isOAuthUser) {
			// 일반 로그인
			authorities.add(new SimpleGrantedAuthority("ROLE_"+user.getRole()));
		} else {
			// 소셜 로그인
			authorities.add(new GrantedAuthority() {
	            @Override
	            public String getAuthority() {
	                return user.getRole();
	            }
	        });
		}
		
		log.info(authorities.toString());
		
		
		
		return authorities;
	}
	
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}


	@Override
	public String getUsername() {
		return user.getUserName();
	}
	
	
	public Long getId() {
		return user.getId();
	}

	// 계정 만료 여부
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

    // 사용자 계정 블락 여부
	@Override
	public boolean isAccountNonLocked() {
		
		// 탈퇴된 계정
		if(user.getWDate() != null || user.getStatus() > 1) {
			return false;
		}
		
		return true;
	}

	// 사용자 자격증명(비밀번호) 만료 여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 사용자 아이디 활성화 여부
	@Override
	public boolean isEnabled() {
		return true;
	}

	/* -- 소셜 로그인 -- */
	
	// OAuth2 사용자의 속성
	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	// OAuth2 사용자의 이름
	@Override
	public String getName() {
        Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
        String email = (String) kakaoAccount.get("email");
		
		return email;
	}

}

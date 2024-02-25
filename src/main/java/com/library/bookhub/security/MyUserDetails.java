package com.library.bookhub.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.library.bookhub.entity.User;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@Builder
@ToString
public class MyUserDetails implements UserDetails {
	
	@Autowired
	private User user;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_"+user.getRole()));
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

	// 계정 만료 여부
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

    // 사용자 계정 블락 여부
	@Override
	public boolean isAccountNonLocked() {
		
		// 탈퇴된 계정
		if(user.getWDate() != null) {
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
}

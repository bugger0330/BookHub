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
		MemberType memberType = MemberType.values()[user.getType()];
		
		authorities.add(new SimpleGrantedAuthority(memberType.getRole()));
		log.info("type : "+user.getType());
		log.info("Role : "+memberType.getRole());
		
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


	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

    // 사용자 아이디 만료 여부
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 사용자 아이디 잠김 여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 사용자 아이디 사용가능 여부
	@Override
	public boolean isEnabled() {
		return true;
	}
}

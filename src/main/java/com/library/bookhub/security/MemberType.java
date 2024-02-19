package com.library.bookhub.security;

import lombok.Getter;

// member 타입 변환
@Getter
public enum MemberType {
	
	USER(1,"ROLE_USER"),
    ADMIN(9,"ROLE_ADMIN");
	
	private final String role;
	
	MemberType(int type,String role) {
		this.role = role;
	}
	
}

package com.library.bookhub.web.dto.member;

import java.time.LocalDateTime;

import lombok.Data;


// 회원가입 정보 입력 dto
@Data
public class SignUpFormDto {
	
	private String uid; // userName
	private String password;
	private String name;
	private int gender;
	private String hp; // phone
	private String email;
	private int type;
	private String zip;
	private String addr1;
	private String addr2;
	private LocalDateTime rdate;
	
}

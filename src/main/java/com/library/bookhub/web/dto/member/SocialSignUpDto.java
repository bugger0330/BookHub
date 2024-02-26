package com.library.bookhub.web.dto.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SocialSignUpDto {
	
	private String uid;
	private String password;
	private String name;
	private String email;
	private String social;
}

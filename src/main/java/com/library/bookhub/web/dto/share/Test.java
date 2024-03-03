package com.library.bookhub.web.dto.share;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test {

	public static void main(String[] args) {
		
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		String test = bc.encode("ddd");
		System.out.println(test);
	}
}

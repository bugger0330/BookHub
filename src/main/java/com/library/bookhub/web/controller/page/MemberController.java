package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	// 회원가입 페이지
	@GetMapping("/register")
	public String registerPage() {
		
		return "user/register";
	}
	
	// 약관 페이지
	@GetMapping("/join")
	public String joinPage() {
		
		return "user/join";
	}
	
	// 아이디 찾기 페이지
	@GetMapping("/findId")
	public String findIdPage() {
		
		return "user/findId";
	}
	
	// 아이디 찾기 결과 페이지
	@GetMapping("/findIdResult")
	public String findIdResultPage() {
		
		return "user/findIdResult";
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/findPwd")
	public String findPwdPage() {
		
		return "user/findPwd";
	}
	@GetMapping("/findPwdChange")
	public String findPwdChangePage() {
		
		return "user/findPwdChange";
	}
	
}

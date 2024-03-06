package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class MemberController {

	/*	
	 * 	주소 -
	 *  http://localhost/(아래 이름)
	 */
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUpPage() {
		
		return "pages/user/signUp";
	}
	
	
	// 약관 페이지
	@GetMapping("/join")
	public String joinPage() {
       
       return "pages/user/join";
	}
	
	// 아이디 찾기 페이지
	@GetMapping("/findId")
	public String findIdPage() {
		
		return "pages/user/findId";
	}
	
	// 아이디 찾기 결과 페이지
	@GetMapping("/findIdResult")
	public String findIdResultPage() {
		
		return "pages/user/findIdResult";
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/findPwd")
	public String findPwdPage() {
		
		return "pages/user/findPwd";
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/findPwdChange")
	public String findPwdChangePage() {
		
		return "pages/user/findPwdChange";
	}
	
	
}

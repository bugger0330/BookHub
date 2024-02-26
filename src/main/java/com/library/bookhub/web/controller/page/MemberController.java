package com.library.bookhub.web.controller.page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.service.MemberService;
import com.library.bookhub.web.dto.member.SignUpFormDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/user")
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	
	/*	
	 * 	주소 -
	 *  http://localhost/(아래 이름)
	 */
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUpPage() {
		
		return "pages/user/signUp";
	}
	
	// 회원가입 기능
	@PostMapping("/signUp")
	public String signUpLogic(@Validated SignUpFormDto dto, BindingResult bindingResult) {
		log.info(dto.toString());
		
		if (bindingResult.hasErrors()) {
	        List<ObjectError> errors = bindingResult.getAllErrors();
	        for (ObjectError error : errors) {
	        	log.error(error.getDefaultMessage());
	        }
	    }
		
		memberService.createUser(dto);
		
		return "redirect:/";
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
	
	
	// 아이디 중복 확인
	@PostMapping("/confirmId/{uid}")
	@ResponseBody
	public int checkUid(@PathVariable("uid") String uid) {
		log.info("uid : "+uid);
		
		int num = memberService.confirmUid(uid);
		
		return num;
	}
	
	// 아이디 찾기 결과
	@GetMapping("/findUids")
	@ResponseBody
	public List<String> findResult(HttpSession session) {
		log.info("findResult...1");
		
		List<String> uids = (List<String>) session.getAttribute("uids");
		log.info("uids : "+uids);
		
		return uids;
	}
}

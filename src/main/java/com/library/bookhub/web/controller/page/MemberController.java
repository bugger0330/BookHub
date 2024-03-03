package com.library.bookhub.web.controller.page;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.handler.exception.CustomPageException;
import com.library.bookhub.handler.exception.CustomRestFulException;
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
	@PostMapping("/findUids")
	@ResponseBody
	public List<String> findResult(@RequestBody Map<String, String> email) {
		log.info("findResult...1");
		String email1 = email.get("email");
		log.info("받는 자 : "+email1);
		
		List<String> uids = memberService.findUid(email1);
		log.info("uids : "+uids);
		
		return uids;
	}
	
	// 비밀번호 변경
	@PostMapping("/findPwdChange")
	@ResponseBody
	public int changePassword(@RequestBody Map<String, String> password, HttpSession session) {
		
		String newPassword = password.get("password");
		String username = (String) session.getAttribute("findByUsername");
		
		log.info("changePassword : "+newPassword+", "+username);
		
		if(username == null || username.isEmpty() || username == "") {
			throw new CustomRestFulException("변경할 비밀번호의 아이디가 존재하지 않습니다", HttpStatus.BAD_REQUEST);
		}
		
		int result = memberService.modifyPassword(username, newPassword);
		log.info("result : "+result);
		
	    session.removeAttribute("findByUsername");
		
		return result;
	}
	
}

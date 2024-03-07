package com.library.bookhub.web.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.MemberService;
import com.library.bookhub.web.dto.member.SignUpFormDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserSignUpController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 기능
	@PostMapping("/signUp")
	public String signUpLogic(@Validated SignUpFormDto dto, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
	        List<ObjectError> errors = bindingResult.getAllErrors();
	        for (ObjectError error : errors) {
	        	log.error(error.getDefaultMessage());
	        	throw new CustomRestFulException("회원가입란을 확인해주세요", HttpStatus.UNAUTHORIZED);
	        }
	    }
		
		memberService.createUser(dto);
		
		return "redirect:/";
	}
	
	// 아이디 중복 확인
	@PostMapping("/confirmId/{uid}")
	@ResponseBody
	public int checkUid(@PathVariable("uid") String uid) {
		
		int num = memberService.confirmUid(uid);
		
		return num;
	}
	
	// 아이디 찾기 결과
	@PostMapping("/findUids")
	@ResponseBody
	public List<String> findResult(@RequestBody Map<String, String> email) {
		String email1 = email.get("email");
		
		List<String> uids = memberService.findUid(email1);
		
		return uids;
	}
	
	// 비밀번호 변경
	@PostMapping("/findPwdChange")
	@ResponseBody
	public int changePassword(@RequestBody Map<String, String> password, HttpSession session) {
		
		String newPassword = password.get("password");
		String username = (String) session.getAttribute("findByUsername");
		
		
		if(username == null || username.isEmpty() || username == "") {
			throw new CustomRestFulException("변경할 비밀번호의 아이디가 존재하지 않습니다", HttpStatus.BAD_REQUEST);
		}
		
		int result = memberService.modifyPassword(username, newPassword);
		
	    session.removeAttribute("findByUsername");
		
		return result;
	}
}

package com.library.bookhub.web.controller.page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bookhub.security.handler.exception.CustomRestfulException;
import com.library.bookhub.service.MailService;
import com.library.bookhub.service.MemberService;
import com.library.bookhub.web.dto.member.SignUpFormDto;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/user")
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	/*	
	 * 	주소 -
	 *  http://localhost/(아래 이름)
	 */
	
	// 회원가입 페이지
	@GetMapping("/signUp")
	public String signUpPage() {
		
		return "user/signUp";
	}
	
	// 회원가입 기능
	@PostMapping("/signUp")
	public String signUpLogic(@Validated SignUpFormDto dto, BindingResult bindingResult) {
		log.info(dto.toString());
		
		if (bindingResult.hasErrors()) {
	        List<ObjectError> errors = bindingResult.getAllErrors();
	        for (ObjectError error : errors) {
	        	log.info(error.getDefaultMessage());
	        }
	        // 유효성 검사 실패 시 처리
	    }
		
		memberService.createUser(dto);
		
		return "redirect:/";
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
	
	// 비밀번호 변경 페이지
	@GetMapping("/findPwdChange")
	public String findPwdChangePage() {
		
		return "user/findPwdChange";
	}
	
	
	// 아이디 중복 확인
	@PostMapping("/confirmId/{uid}")
	@ResponseBody
	public int checkuid(@PathVariable("uid") String uid) {
		log.info("uid : "+uid);
		
		int num = memberService.confirmUid(uid);
		
		return num;
	}
	
	
	/* -- 이메일 인증 -- */
	// 이메일 전송
	@PostMapping("/sendEmail/{email}")
	public void sendEmail(@PathVariable("email")String email) {
		log.info("받는 자 : "+email);
		
		try {
			mailService.sendCodeByEmail(email);
		} catch (Exception e) {
			log.error(e);
			throw new CustomRestfulException("전송에 문제가 발생했습니다. 고객센터로 문의해주세요.", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	// 인증 번호
	@GetMapping("/authNumber")
	@ResponseBody
	public int authEmail(@RequestParam("number") String number) {
		log.info("입력한 번호 : "+number);
		
		int result = mailService.confirmCodeByEmail(number);
		log.info("결과 값 : "+result);
		
		
		return result;
		
	}
	
}

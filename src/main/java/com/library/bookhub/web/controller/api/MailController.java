package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.MailService;
import com.library.bookhub.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberService memberService;
	
	/* --- 회원가입 --- */
	// 이메일 전송
	@PostMapping("/user/sendEmail/{email}")
	public void sendEmail(@PathVariable("email")String email) {
		log.info("받는 자 : "+email);
		
		try {
			mailService.sendCodeByEmail(email);
		} catch (Exception e) {
			log.error(e);
			throw new CustomRestFulException("전송에 문제가 발생했습니다. 고객센터로 문의해주세요.", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	// 인증 번호
	@GetMapping("/user/authNumber")
	@ResponseBody
	public int authEmail(@RequestParam("number") String number) {
		log.info("입력한 번호 : "+number);
		
		int result = mailService.confirmCodeByEmail(number);
		log.info("결과 값 : "+result);
		
		
		return result;
		
	}
	
	/* --- 아이디 찾기 --- */
	// 이메일 전송
	@PostMapping("/findId/sendEmail/{email}")
	@ResponseBody
	public int findIdEmail(@PathVariable("email")String email, HttpSession session) {
		int result = 0;
		log.info("받는 자 : "+email);
		
		List<String> uids = memberService.findUid(email);
		log.info("uids : "+uids);
		
		if(uids == null || uids.isEmpty()) {
			throw new CustomRestFulException("아이디가 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		
		try {
			mailService.sendCodeByEmail(email);
			result = 1;
		} catch (Exception e) {
			log.error(e);
			throw new CustomRestFulException("전송에 문제가 발생했습니다. 고객센터로 문의해주세요.", HttpStatus.BAD_REQUEST);
		}
		
		log.info("result : "+result);
		session.setAttribute("uids", uids);
		
		return result;
	}
	
	// 인증 번호
	@GetMapping("/findId/authNumber")
	@ResponseBody
	public int findIdNumber(@RequestParam("number") String number) {
		log.info("입력한 번호 : "+number);
		
		int result = mailService.confirmCodeByEmail(number);
		log.info("결과 값 : "+result);
		
		
		return result;
		
	}
}

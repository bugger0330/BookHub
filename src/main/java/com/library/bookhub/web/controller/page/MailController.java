package com.library.bookhub.web.controller.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.security.handler.exception.CustomRestfulException;
import com.library.bookhub.service.MailService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class MailController {
	
	@Autowired
	private MailService mailService;
	
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

package com.library.bookhub.web.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void sendEmail(@PathVariable("email") String email) {

		try {
			mailService.sendCodeByEmail(email);
		} catch (Exception e) {
			throw new CustomRestFulException("전송에 문제가 발생했습니다. 고객센터로 문의해주세요.", HttpStatus.BAD_REQUEST);
		}

	}

	// 인증 번호
	@GetMapping("/user/authNumber")
	@ResponseBody
	public int authEmail(@RequestParam("number") String number) {

		int result = mailService.confirmCodeByEmail(number);
		return result;

	}

	/* --- 아이디 찾기 --- */

	// 이메일 전송
	@PostMapping("/findId/sendEmail")
	@ResponseBody
	public String findIdEmail(@RequestBody Map<String, String> email) {
		String email1 = email.get("email");

		try {
			mailService.sendCodeByEmail(email1);
		} catch (Exception e) {
			throw new CustomRestFulException("이메일 전송에 실패했습니다.", HttpStatus.BAD_REQUEST);
		}

		return email1;
	}

	// 인증 번호
	@GetMapping("/findId/authNumber")
	@ResponseBody
	public int findIdNumber(@RequestParam("number") String number) {

		int result = mailService.confirmCodeByEmail(number);

		return result;

	}

	/* --- 비밀번호 찾기 --- */

	// 이메일 전송
	@PostMapping("/findPwd/sendEmail")
	@ResponseBody
	public Map<String, Object> findPwdEmail(@RequestBody Map<String, String> Data) {

		String email = Data.get("email");
		String username = Data.get("username");

		int result = memberService.findPassword(username, email);

		try {
			mailService.sendCodeByEmail(email);
		} catch (Exception e) {
			result = 0;
		}

		Map<String, Object> responseData = new HashMap<>();
		responseData.put("result", result);
		responseData.put("username", username);

		return responseData;
	}

	// 인증 번호
	@GetMapping("/findPwd/authNumber")
	@ResponseBody
	public int findPwdNumber(@RequestParam("num") String num, @RequestParam("username") String username,
			HttpSession session) {

		int result = mailService.confirmCodeByEmail(num);
		
		if(result >= 1) {
			session.setAttribute("findByUsername", username);
		}

		return result;

	}

}

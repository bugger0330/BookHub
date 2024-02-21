package com.library.bookhub.web.controller.page;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	
	// 이메일 전송
	@PostMapping("/sendEmail")
	public void sendEmail() {
		
	}
}

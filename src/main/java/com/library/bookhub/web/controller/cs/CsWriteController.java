package com.library.bookhub.web.controller.cs;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsWriteController {

	// qna write 페이지
	@GetMapping("/write")
	public String qnaWritePage() {
		return "pages/cs/qna/write";
	}

}
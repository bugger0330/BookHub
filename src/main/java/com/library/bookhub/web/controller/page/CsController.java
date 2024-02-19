package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CsController {

	// 공지사항 페이지
	@GetMapping("/notice")
	public String noticePage() {
		return "pages/cs/notice/notice";
	}

	// 자주 묻는 질문 페이지
	@GetMapping("/faq")
	public String faqPage() {
		return "pages/cs/faq/faq";
	}

	// 문의하기 페이지
	@GetMapping("/qna")
	public String qnaPage() {
		return "pages/cs/qna/qna";
	}

	// 챗봇

	
}

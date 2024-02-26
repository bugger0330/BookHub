package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookPageController {

	// 도서목록 가져오기
	@GetMapping("/list-all")
	public String bookList() {
		return "pages/book/bookList";
	}
	
	// 도서 상세 페이지
	@GetMapping("/detail/{num}")
	public String bookDetail() {
		return "pages/book/bookDetail";
	}
	
	// 도서 통합검색 페이지
	@GetMapping("/search")
	public String searchPage() {

		return "pages/book/bookSearch";
	}
}

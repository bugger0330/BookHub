package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookPageController {

	@GetMapping("/list-all")
	public String bookList() {
		return "pages/book/bookList";
	}
	
	@GetMapping("/detail/{num}")
	public String bookDetail() {
		return "pages/book/bookDetail";
	}
}

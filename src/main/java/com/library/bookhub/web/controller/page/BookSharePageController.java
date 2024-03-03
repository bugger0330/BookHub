package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/share")
public class BookSharePageController {

	@GetMapping("/write")
	public String shareBookWrite() {
		return "pages/share/write";
	}
	@GetMapping("/read")
	public String shareBookRead() {
		return "pages/share/read";
	}
	@GetMapping("/detail/{id}")
	public String shareBookDetail() {
		return "pages/share/detail";
	}
}

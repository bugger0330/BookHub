package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/point")
public class PointPageController {

	@GetMapping("/cafe")
	public String cafe() {
		return "pages/point/cafe";
	}
	@GetMapping("/print")
	public String print() {
		return "pages/point/print";
	}
	@GetMapping("/computer")
	public String computer() {
		return "pages/point/computer";
	}
}

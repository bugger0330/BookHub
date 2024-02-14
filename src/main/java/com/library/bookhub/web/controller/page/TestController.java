package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String home() {
		return "home";
	}
}

// page 패키지에는 페이지를 여는 용도로만 사용
// 실제 데이터를 리턴하는건 api 패키지를 이용

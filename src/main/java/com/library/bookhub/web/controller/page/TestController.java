package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String home() {
		return "home";
	}

	// 로그인페이지
	@GetMapping("/login")
	public String loginPage() {

		return "user/login";
	}

	// about 페이지
	@GetMapping("/about")
	public String aboutPage() {

		return "pages/about/about";
	}

	// 도서 통합검색 페이지
	@GetMapping("/search")
	public String searchPage() {

		return "pages/book/search";
	}

	// 추천도서 페이지
	@GetMapping("/suggest")
	public String suggestPage() {
		return "pages/book/suggest";
	}
	
	// 어드민 페이지
		@GetMapping("/admin")
		public String adminPage() {
			return "pages/admin/mainAdmin";
		}
}

// page 패키지에는 페이지를 여는 용도로만 사용
// 실제 데이터를 리턴하는건 api 패키지를 이용

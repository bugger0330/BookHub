package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarPointPageController {
	
	// 출석체크 페이지
	@GetMapping("/calendarPoint")
	public String calendarPage() {
		
		return "pages/user/calendarPoint";
	}
	
}

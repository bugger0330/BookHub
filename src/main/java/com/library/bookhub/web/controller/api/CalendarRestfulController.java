package com.library.bookhub.web.controller.api;

import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.service.CalendarPointService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/*
 * 출석체크 페이지
 * 
 */

@Slf4j
@RestController
public class CalendarRestfulController {
	
	@Autowired
	private CalendarPointService calendarPointService;
	
	// 날짜 계산, 출석체크 조회
	@GetMapping("/calendar/month")
	public Map<String, Integer> CalculateDate(HttpSession session) {
		
		// 현재 월과 일 계산
        Calendar cal = Calendar.getInstance();
        
        // 현재 월,일
        int currentMonth = cal.get(Calendar.MONTH) + 1;
        int currentDay = cal.get(Calendar.DAY_OF_MONTH);

        Map<String, Integer> result = new HashMap<>();
        result.put("month", currentMonth);
        result.put("today", currentDay);
        
        // 날짜 불러오기
        List<Integer> days = (List<Integer>) session.getAttribute("attendanceDays");
        log.info("days : "+days);
        
        return result;
        
	}
	
	// 포인트 적립, 출석 일수
	@PostMapping("/calendar/attendance")
	@ResponseBody
	public Map<String, Integer> attendanceCheck(@RequestParam("today") int today,
						@AuthenticationPrincipal UserDetails user, HttpSession session) {
		int addPoint = 0;
		String userId = user.getUsername();
		
		log.info("login userId : "+userId);
		log.info("today : "+today);
		
		// 출석일 기록
		List<Integer> days = Arrays.asList(today);
		session.setAttribute("attendanceDays", days);
		
		int size = days.size();
		log.info("days count : "+size);
		
		// 7일 적립
		if(size == 7) {
			session.setAttribute("7days", size);
			addPoint = calendarPointService.completePoint(userId);
		}
		
		Map<String, Integer> result = new HashMap<>();
        result.put("size", size);
        result.put("point", addPoint);
		
		return result;
	}
	
}

package com.library.bookhub.web.controller.api;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.Attendance;
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
	public Map<String, Object> CalculateDate(@AuthenticationPrincipal UserDetails user) {
		String userId = user.getUsername();
		// 현재 날짜 가져오기
        Calendar cal = Calendar.getInstance();
        
        // 현재 월,일
        int currentMonth = cal.get(Calendar.MONTH) + 1;
        int currentDay = cal.get(Calendar.DAY_OF_MONTH);
        
        // 현재 정보 불러오기
        Attendance attendanceEntity = calendarPointService.readAttendance(userId);
        
        // 날짜 불러오기
        String attendanceDays = attendanceEntity.getAttendanceDays();
        List<Integer> days = arrayConverter(attendanceDays);
        
        // 지난 달(혹은 현재 월)
        Integer lastMonth = attendanceEntity.getLastMonth();
        log.info("lastMonth : "+lastMonth);
        
        // 다음 달이 된 경우
        if (lastMonth == null || lastMonth != currentMonth) {
            // 출석일 초기화
        	calendarPointService.modifyLastMonth(currentMonth,userId);
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("month", currentMonth);
        result.put("today", currentDay);
        result.put("attendance", days);
        
        return result;
        
	}
	
	// 포인트 적립, 출석 일수
	@PostMapping("/calendar/attendance")
	@ResponseBody
	public Map<String, Integer> attendanceCheck(@RequestBody Map<String, Object> date,
												@AuthenticationPrincipal UserDetails user, 
												HttpSession session) {
		int addPoint = 0;
		String userId = user.getUsername();
		String today = (String) date.get("today");
		int month = (Integer) date.get("month");
		
		log.info("today : "+today);
		log.info("month : "+month);
		
		// 현재 정보 불러오기
        Attendance attendanceEntity = calendarPointService.readAttendance(userId);
		
        // 첫 출석체크 등록자
        if(attendanceEntity == null) {
        	calendarPointService.createAttendance(userId, month, today);
        }
		
        // 날짜 불러오기
        String attendanceDays = attendanceEntity.getAttendanceDays();
        List<Integer> days = arrayConverter(attendanceDays);
        int size = days.size();
        
        // 출석일수 추가
        if(size < 7) {
        	calendarPointService.modifyAttendanceDays(today, userId);
        }
        
		// 7일이 되면 적립
		if(size == 7) {
			addPoint = calendarPointService.completePoint(userId);
			log.info("addPoint : "+addPoint);
		}
		
		Map<String, Integer> result = new HashMap<>();
        result.put("size", size);
        result.put("point", addPoint);
		
		return result;
	}
	
	
	// attendanceDays(String) -> 배열(int[]) 전환 
	public List<Integer> arrayConverter(String attendanceDays) {
		List<Integer> days = new ArrayList<>();
        
        if(attendanceDays != null) {
            String[] splitDays = attendanceDays.split(", ");
            
            for (String day : splitDays) {
                days.add(Integer.parseInt(day));
            }
        }
        log.info("days : "+days);
		
		return days;
	}
	
}

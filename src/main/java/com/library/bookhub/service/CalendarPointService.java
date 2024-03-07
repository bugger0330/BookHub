package com.library.bookhub.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.Attendance;
import com.library.bookhub.repository.AttendanceRepository;
import com.library.bookhub.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CalendarPointService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private AttendanceRepository attendanceRepository;
	
	
	// 출석체크 첫 등록
	@Transactional
	public Attendance createAttendance(String userId, int month, String day) {
		
		Attendance attendance = Attendance.builder()
										.userId(userId)
										.lastMonth(month)
										.attendanceDays(day+", ")
										.build();
		
		int result = attendanceRepository.insert(attendance);
		
		return attendance;
	}
	
	// 출석체크 조회
	public Attendance readAttendance(String userId) {
		return attendanceRepository.selectByUserId(userId);
	}
	
	// 다음 달로 변경
	@Transactional
	public List<Integer> modifyLastMonth(int lastMonth, String userId) {
		attendanceRepository.updateByNewMonth(lastMonth, userId);
		
		// 출석일수 초기화
		Attendance attendance = attendanceRepository.selectByUserId(userId);
		List<Integer> days = arrayConverter(attendance.getAttendanceDays());
		
		return days;
	}
	
	// 출석일 증가
	public Attendance modifyAttendanceDays(String today, String userId) {
		int result = attendanceRepository.updateByAttendanceDays(today+", ", userId);
		Attendance attendance = attendanceRepository.selectByUserId(userId);
		
		return attendance;
	}
	
	// 포인트 적립
	@Transactional
	public int completePoint(String username) {
		int addPoint = randomPoint();
		
		// 포인트 기록
		attendanceRepository.updatePoint(addPoint, username);
		// 포인트 저장
		int result = memberRepository.updateAttendanceByPoint(addPoint, username);
		
		return addPoint;
	}
	
	// 포인트 랜덤
	public int randomPoint() {
		int[] randoms = {10, 50, 100, 350, 700};
		
        Random random = new Random();
        int index = random.nextInt(randoms.length);

        // 선택된 인덱스에 해당하는 값 반환
        return randoms[index];
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
		
		return days;
	}
}

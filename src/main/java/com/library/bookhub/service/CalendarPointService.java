package com.library.bookhub.service;

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
	public int createAttendance(String userId, int month, String day) {
		
		Attendance attendance = Attendance.builder()
										.userId(userId)
										.lastMonth(month)
										.attendanceDays(day+", ")
										.build();
		log.info("attendance : "+attendance);
		
		int result = attendanceRepository.insert(attendance);
		
		return result;
	}
	
	// 출석체크 조회
	public Attendance readAttendance(String userId) {
		return attendanceRepository.selectByUserId(userId);
	}
	
	// 다음 달로 변경
	@Transactional
	public int modifyLastMonth(int lastMonth, String userId) {
		int result = attendanceRepository.updateByNewMonth(lastMonth, userId);
		return result;
	}
	
	// 출석일 증가
	public int modifyAttendanceDays(String today, String userId) {
		int result = attendanceRepository.updateByAttendanceDays(today+", ", userId);
		return 0;
	}
	
	// 포인트 적립
	@Transactional
	public int completePoint(String username) {
		int addPoint = randomPoint();
		
		int result = memberRepository.updateAttendanceByPoint(addPoint, username);
		log.info("completePoint : "+result+", user : "+username);
		
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
}

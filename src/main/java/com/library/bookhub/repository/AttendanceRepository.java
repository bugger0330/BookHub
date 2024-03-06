package com.library.bookhub.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Attendance;

@Mapper
public interface AttendanceRepository {
	
	// 출석 등록
	public int insert(Attendance attendance);
	
	// 출석 조회
	public Attendance selectByUserId(String userId);
	
	// 달 갱신
	public int updateByNewMonth(@Param("lastMonth") int lastMonth,@Param("userId") String userId);
	
	// 출석일수 조회
	public int selectByDays(@Param("attendanceDays") String attendanceDays,@Param("userId") String userId);
	
	// 출석일수 추가
	public int updateByAttendanceDays(@Param("attendanceDays") String attendanceDays,@Param("userId") String userId);
}

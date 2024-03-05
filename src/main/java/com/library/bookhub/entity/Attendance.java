package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * 출석체크 Entity
 * 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attendance {
	
	private Long id;
	private String userId;
	private int lastMonth; // 지난 달(혹은 현재 달)
	private String attendanceDays; // 출석일
}

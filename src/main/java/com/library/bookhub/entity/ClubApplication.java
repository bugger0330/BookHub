package com.library.bookhub.entity;

import java.sql.Timestamp;

import com.library.bookhub.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubApplication {
	
	private Integer id;
	private Integer clubId;
	private String userName;
	private Timestamp rdate;
	private Timestamp wdate;

	// 조인 칼럼 추가
	private String clubName;
	private String uploadFileName1;
	
	// 이미지설정
	public String setupClubImage() {
		return "/img/club/" + uploadFileName1; 
	}
	
	// 신청날짜 포멧설정
	public String formatCreatedAt() {
		return TimeUtils.dateToString(rdate);
	}
	
}

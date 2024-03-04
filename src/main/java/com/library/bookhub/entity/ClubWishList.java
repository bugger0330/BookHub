package com.library.bookhub.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClubWishList {

	private Integer id;
	private Integer clubId;
	private String userName;
	private LocalDateTime rdate; // Timestamp랑 무슨 차이??
	private LocalDateTime wdate;
	
	// 조인칼럼 추가
	private String clubName;
	private String descript;
	private Timestamp cDate;
	private String uploadFileName1;
	
	// 이미지 설정
	public String setupClubImage() {
		return "/img/club/" + uploadFileName1;
	}
	
	// 모임날짜 포멧설정
	public String formatCDate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd(E) HH:mm");
		return sdf.format(cDate);
	}
}

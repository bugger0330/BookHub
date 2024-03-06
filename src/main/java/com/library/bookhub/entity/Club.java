package com.library.bookhub.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.library.bookhub.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Club {

	
	
	private Integer id;
	private String userName;
	private Integer clubCate;
	private String clubName;
	private String descript;
	private String detail;
	private Timestamp cDate;
	private String host;
	private Integer headCount;
	private Integer hcApply;
	private String status;
	private String originFileName1;
	private String originFileName2;
	private String originFileName3;
	private String uploadFileName1;
	private String uploadFileName2;
	private String uploadFileName3;
	private Timestamp rdate;
	private Timestamp wdate;
	
	// 이미지설정
	public String setupClubImage() {
		return "/img/club/" + uploadFileName1; 
	}
	
	// 신청인원수 수정
	public void setupHcApply() {
		this.hcApply += 1;
	}
	
	// 신청인원수 수정
	public void minusHcApply() {
		this.hcApply -= 1;
	}
	
	// 개설날짜 포멧설정
	public String formatCreatedAt() {
		return TimeUtils.dateToString(rdate);
	}
	
//	// 모임날짜 포멧설정
//	public String formatCDate() {
//		return TimeUtils.timestampToString(cDate);
//	}
	
	// 모임날짜 포멧설정
	public String formatCDate() {
		
		// 원하는 날짜 형식을 지정 ex) 03-01(금) 10:00
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd(E) HH:mm");
		
		// 날짜를 원하는 형식으로 변환
		String formattedDate = sdf.format(cDate);
		
		return formattedDate;
	}
	
}

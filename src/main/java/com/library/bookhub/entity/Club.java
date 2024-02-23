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
	
}

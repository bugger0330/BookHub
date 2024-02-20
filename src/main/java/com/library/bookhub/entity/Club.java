package com.library.bookhub.entity;

import java.sql.Timestamp;

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
	private Timestamp cDate;
	private String host;
	private Integer headCount;
	private String hcApply;
	private String status;
	private String originFileName1;
	private String originFileName2;
	private String originFileName3;
	private String uploadFileName1;
	private String uploadFileName2;
	private String uploadFileName3;
	private Timestamp rdate;
	private Timestamp wdate;
	
	public String setupClubImage() {
		return "/img/club/" + uploadFileName1; 
	}
}

package com.library.bookhub.web.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClubSaveFormDto {

	private Integer clubCate;
	private String clubName;
	private String descript;
	private Timestamp cDate;
	private String host;
	private Integer headCount;
	
	// 파일처리
	
	private MultipartFile customFile; // name 속성값과 동일해야한다 / 이미지 여려개는 []
	
	private String originFileName1;
	private String originFileName2;
	private String originFileName3;
	private String uploadFileName1;
	private String uploadFileName2;
	private String uploadFileName3;
}

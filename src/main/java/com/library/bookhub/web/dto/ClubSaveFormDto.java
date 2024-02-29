package com.library.bookhub.web.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class ClubSaveFormDto {

	private Integer clubCate;
	private String clubName;
	private String descript;
	private String detail;
	// input 태그 type="datetime-local" 는 String임, Timestamp에서 String으로 변경
	private String cDate;
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
	
	// "YYYY-MM-DDTHH:MM" 형식인 cDate의 String을 Timestamp로 변환
	// 문자열을 LocalDateTime으로 파싱하고 LocalDateTime 객체를 Timestamp 객체로 변환
	public Timestamp toTimestamp() {
		
		Timestamp timestamp = null;
		
		// LocalDateTime.parse() 나 Timestamp.valueOf() 에서 잘못된 문자열 입력될 경우 예외발생가능하므로
		// 예외처리를 해주는 것이 좋다
		try {
			LocalDateTime localDateTime = LocalDateTime.parse(cDate, DateTimeFormatter.ISO_DATE_TIME);
			timestamp = Timestamp.valueOf(localDateTime);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return timestamp;
	}
	
}

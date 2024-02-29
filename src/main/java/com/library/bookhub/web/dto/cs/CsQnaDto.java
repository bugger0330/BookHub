package com.library.bookhub.web.dto.cs;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CsQnaDto {

	private int id;
	private int cate1;
	private int cate2;
	private String title;
	private String content;
	private String ofiles ;
	private String sfiles ;
	private String fileData ;
	private String writer;
	private int answerComplete;
	private Timestamp rdate;



}

package com.library.bookhub.web.dto.cs;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CsNoticeDto {

	private int id;
	private int cate1;
	private int cate2;
	private String title;
	private String content;
	private String writer;
	private List<MultipartFile> filepath;
	private Timestamp rdate;





}

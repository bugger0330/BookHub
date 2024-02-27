package com.library.bookhub.web.dto.cs;

import java.sql.Timestamp;

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
	private int hit;
	private String writer;
	private String ofile;
	private String sfile;
	private Timestamp rdate;





}

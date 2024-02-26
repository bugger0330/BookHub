package com.library.bookhub.web.dto.cs;

import java.sql.Timestamp;

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
public class CsNoticeDto {

	private int id;
	private int cate1;
	private int cate2;
	private String title;
	private String content;
	private int hit;
	private Timestamp rdate;
	private String ofile;
	private String sfile;
	private String writer;




}

package com.library.bookhub.entity.cs;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CsQnaEntity {

	private Integer id;
	private Integer cate1;
	private Integer cate2;
	private String title;
	private String content;
	private String ofile1 ;
	private String ofile2 ;
	private String sfile1 ;
	private String sfile2 ;
	private String writer;
	private Integer answerComplete;
	private Timestamp rdate;
}

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
public class CsQnaDto {

	private int id;
	private int cate1;
	private int cate2;
	private String title;
	private String content;
	private String file1 ;
	private String file2 ;
	private String file3 ;
	private String file4 ;
	private String writer;
	private int answerComplete;
	private Timestamp rdate;






}

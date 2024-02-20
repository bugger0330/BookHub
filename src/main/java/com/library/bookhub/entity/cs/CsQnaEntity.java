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
	private String file1 ;
	private String file2 ;
	private String file3 ;
	private String file4 ;
	private String writer;
	private Integer answerComplete;
	private Timestamp rdate;
}

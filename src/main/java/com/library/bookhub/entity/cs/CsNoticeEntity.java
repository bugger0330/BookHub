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
public class CsNoticeEntity {

	private Integer id;
	private Integer cate1;
	private Integer cate2;
	private String title;
	private String content;
	private Integer hit;
	private Timestamp rdate;
	private String ofile;
	private String sfile;
	private String writer;
}

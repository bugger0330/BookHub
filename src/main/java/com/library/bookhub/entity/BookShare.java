package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BookShare {

	private int id;
	private String bookName;
	private String company;
	private String writer;
	private String descript;
	private String userName;
	private String file;
	private String rdate;//등록일
	private String wdate;//반납일
	private String status;//대출여부
}

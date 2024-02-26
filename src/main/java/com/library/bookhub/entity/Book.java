package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Book {

	private int id;
	private String bookName;//도서명
	private String descript;//기본설명
	private String company;//출판사
	private String writer;//작가
	private int borrow;//대출건수
	private String img;//썸네일
	private String status;//대출여부
	private String rdate;//등록일
	private String wdate;//반납일
	private int bookAllCount;
}

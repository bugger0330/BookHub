package com.library.bookhub.web.dto.common;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PageReq {
	
	// 현재 페이지 번호 : page == number
	private int page;
	
	// 페이지당 출력할 데이터 개수
	private int size;

	public PageReq(int page, int size) {
		this.page = page;
		this.size = size;
	}
	
	

}

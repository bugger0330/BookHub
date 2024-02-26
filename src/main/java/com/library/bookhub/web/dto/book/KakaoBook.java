package com.library.bookhub.web.dto.book;

import java.util.List;

import com.library.bookhub.entity.Book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class KakaoBook {

	private String title; // 제목
	private List<titleList> authors; // 도서 저자 리스트(인덱스 0번만)
	private String publisher; // 도서 출판사
	private String contents; // 상세정보
	private String thumbnail; // 이미지
	
	@NoArgsConstructor
	@AllArgsConstructor
	@Data
	public static class titleList{
		private String authors; // 도서 저자
	}
	
	public Book toEntity() {
		return Book.builder()
				.bookName(title)
				.descript(contents)
				.company(publisher)
				.writer(authors.get(0).getAuthors())
				.img(thumbnail)
				.build();
	}
}

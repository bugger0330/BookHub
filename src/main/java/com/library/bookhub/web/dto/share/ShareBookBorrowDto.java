package com.library.bookhub.web.dto.share;

import com.library.bookhub.entity.ShareBookBorrow;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShareBookBorrowDto {

	private int bookId;
	private String userName;
	private int borrowDay;
	private String wdate;
	
	public ShareBookBorrow toEntity() {
		return ShareBookBorrow.builder()
				.bookNo(bookId)
				.userName(userName)
				.borrowDay(borrowDay)
				.wdate(wdate)
				.build();
	}
}

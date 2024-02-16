package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BookBorrow {

	private int id;
	private String userName;
	private String brComplete;
	private String brDate;
	private String returnDate;
	private int bookNo;
}

package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ShareBookBorrow {

	private int id;
	private int bookId;
	private String userName;
	private int borrowDay;
	private String wdate;
	private int flag;
}

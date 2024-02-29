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

	private int bookNo;
	private String userName;
	private int borrowDay;
	private String wdate;
}

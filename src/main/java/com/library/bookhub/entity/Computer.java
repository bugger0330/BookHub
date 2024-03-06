package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Computer {

	private int id;
	private int comNumber;//컴퓨터 번호
	private int time;// 사용시간
	private String endTime;// 끝나는 시각
	private int status;// 1 - 사용중 / 0 - 사용가능
	
}

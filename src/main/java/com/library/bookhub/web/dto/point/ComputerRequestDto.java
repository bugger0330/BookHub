package com.library.bookhub.web.dto.point;

import com.library.bookhub.entity.Computer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ComputerRequestDto {

	private int comNumber;//컴퓨터 번호
	private int time;// 사용시간
	private String endTime;// 끝나는 시각
	private int status;// 1 - 사용중 / 0 - 사용가능
	private int flag;
	// flag == 0 사용가능 으로 업데이트
	// flag == 1 사용중으로 업데이트
	// flag == 2 아직 사용중이니 업데이트 안함
	
	public Computer toEntity() {
		return Computer.builder()
				.comNumber(comNumber)
				.time(time)
				.endTime(endTime)
				.status(status)
				.build();
	}
}

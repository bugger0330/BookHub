package com.library.bookhub.web.dto.cs;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CsCate1Dto {

	List<CsCate2Dto> respList;
	
	private int cate1;
	private String c1Name;


}

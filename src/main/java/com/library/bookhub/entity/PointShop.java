package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 포인트샵
 * @Author : 이준혁
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PointShop {
	
	private Long id;
	private String prodName;
	private int point;
	private int price;

}

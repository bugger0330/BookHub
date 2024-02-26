package com.library.bookhub.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 구독 상품 엔티티
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SubscriptionProduct {
	
	private Long spId;
	private String prodName;
	private Long price;
	private int period;
	
	
	// 포메터 기능
		public String formatBalance() {
			// 1000 -> 1,000
			DecimalFormat df = new DecimalFormat("#,###");
			String formaterNumber = df.format(price);
			return formaterNumber + "원";
		}

}
package com.library.bookhub.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
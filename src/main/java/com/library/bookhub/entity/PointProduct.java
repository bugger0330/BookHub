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
public class PointProduct {

	private Integer id;
	private String prodName;
	private Integer price;
	private Integer point;
	private String originFileName;
	private String uploadFileName;
	private String postYn;
	private Timestamp createdAt;

	public String setupPointProductImage() {
		return uploadFileName == null ? "이미지가 없습니다." : "/images/upload/" + uploadFileName;
	}

	// 포메터 기능(금액)
	public String formatBalance() {
		// 1000 -> 1,000
		DecimalFormat df = new DecimalFormat("#,###");
		String formaterNumber = df.format(price);
		return formaterNumber + "원";
	}
	
	// 포메터 기능(금액)
		public String formatBalancePoint() {
			// 1000 -> 1,000
			DecimalFormat df = new DecimalFormat("#,###");
			String formaterNumber = df.format(point);
			return formaterNumber + "포인트";
		}

}

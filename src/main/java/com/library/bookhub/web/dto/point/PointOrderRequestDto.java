package com.library.bookhub.web.dto.point;

import com.library.bookhub.entity.PointOrder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PointOrderRequestDto {

	private int orderId;
	private String userName;
	private String productName;
	private int productPrice;
	private int productCount;
	private int allProductPrice;
	private String refund_type;
	
	public PointOrder toEntity() {
		return PointOrder.builder()
				.orderId(orderId)
				.userName(userName)
				.productName(productName)
				.productPrice(productPrice)
				.productCount(productCount)
				.allProductPrice(allProductPrice)
				.refund_type(refund_type)
				.build();
	}
}

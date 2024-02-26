package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PointOrder {

	private int id;//주문등록번호
	private int orderId;//주문번호
	private String userName;//유저아이디
	private String productName;//상품명
	private int productPrice;//상품가격
	private int productCount;//상품갯수
	private int allProductPrice;//총가격(포인트)
	private String rdate;//주문시각
	private String refund_type;//환불 가능 여부
}

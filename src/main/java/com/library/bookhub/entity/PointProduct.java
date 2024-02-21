package com.library.bookhub.entity;

import java.sql.Timestamp;

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

}

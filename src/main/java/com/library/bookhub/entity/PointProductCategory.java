package com.library.bookhub.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 포인트 상품 카테고리 엔티티(관리자)
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointProductCategory {
	
	private Integer cateId;
	private Integer ppId;
	private String categoryName;
	

}

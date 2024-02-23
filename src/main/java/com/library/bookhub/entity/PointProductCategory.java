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
public class PointProductCategory {
	
	private Integer cateId;
	private Integer ppId;
	private String categoryName;
	

}

package com.library.bookhub.web.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 포인트 상품 등록 폼 DTO
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointProductFormDto {
	
	private String prodName;
	private Integer price;
	private Integer point;
	private String postYn;
	
	// 파일처리
	private String originFileName;
	private String uploadFileName;
	private MultipartFile productImage;

}

package com.library.bookhub.web.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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

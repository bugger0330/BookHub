package com.library.bookhub.web.dto.share;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShareWriteReqDto {

	private String bookName;
	private String company;
	private String writer;
	private String descript;
	private String userName;
	private MultipartFile file;
}

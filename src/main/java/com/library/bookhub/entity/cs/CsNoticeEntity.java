package com.library.bookhub.entity.cs;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CsNoticeEntity {

	private Integer id;
	private Integer cate1;
	private Integer cate2;
	private String title;
	private String content;
	private Integer hit;
	private String writer;
	private List<MultipartFile> filepath;
	private Timestamp rdate;

	
}

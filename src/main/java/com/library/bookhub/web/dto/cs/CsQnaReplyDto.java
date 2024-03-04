package com.library.bookhub.web.dto.cs;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CsQnaReplyDto {

	private int id;
	private String content;
	private String writer;
	private Timestamp rdate;
	private int qnaId;

}

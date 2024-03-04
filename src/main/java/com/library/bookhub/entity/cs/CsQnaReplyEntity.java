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
public class CsQnaReplyEntity {

	private int id;
	private String content;
	private String writer;
	private Timestamp rdate;
	private int qnaId;
}

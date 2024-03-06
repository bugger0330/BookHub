package com.library.bookhub.entity.cs;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.utils.TimeUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CsQnaEntity {

	private int id;
	private int cate1;
	private int cate2;
	private String title;
	private String content;
	private String filepath;
	private String writer;
	private int answerComplete;
	private Timestamp rdate;

	// "yyyy-MM-dd"
	public String formatRdate() {
		return TimeUtils.dateToString(rdate);
	}

}

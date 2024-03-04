package com.library.bookhub.web.dto.cs;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CsFileDto {

	private String uuid;
	private String originalFileName;
	private byte[] fileData;
}

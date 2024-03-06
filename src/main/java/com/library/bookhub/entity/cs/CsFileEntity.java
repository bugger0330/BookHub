package com.library.bookhub.entity.cs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CsFileEntity {
	
	private String uuid;
	private String originalFileName;
	private byte[] fileData;
	

}

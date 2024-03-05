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
public class CancelRequest {
	private String impUid;
	private int amount;
	private String reason;
	private int checksum;

	// Getters and setters
}

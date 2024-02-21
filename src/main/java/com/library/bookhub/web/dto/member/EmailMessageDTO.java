package com.library.bookhub.web.dto.member;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EmailMessageDTO {
	private String to;
    private String subject;
    private String message;
}

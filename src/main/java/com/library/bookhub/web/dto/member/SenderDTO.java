package com.library.bookhub.web.dto.member;

import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;

@Getter
public class SenderDTO {
	@Value("${spring.mail.username}")
    private String username;

    @Value("${spring.mail.password}")
    private String password;
}

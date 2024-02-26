package com.library.bookhub.web.dto.member;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class OauthToken {
	private String accessToken;
	private String tokenType;
	private String refreshToken;
	private String expiresIn;
	private String scope;
}

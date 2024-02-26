
package com.library.bookhub.web.dto.member;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Data;

@Data
public class KakaoAccount {

	private Boolean profileNicknameNeedsAgreement;
	private Profile profile;
	private Boolean hasEmail;
	private Boolean emailNeedsAgreement;
	private Boolean isEmailValid;
	private Boolean isEmailVerified;
	private String email;
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}

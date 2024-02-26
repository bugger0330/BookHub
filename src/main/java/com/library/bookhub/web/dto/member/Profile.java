
package com.library.bookhub.web.dto.member;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Data;

@Data
public class Profile {

	private String nickname;
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}

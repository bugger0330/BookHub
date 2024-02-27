package com.library.bookhub.web.dto.member;

import lombok.Data;

// 카카오 사용자 조회
@Data
public class KakaoUserInfo {
	
	private String id;
    private String nickname;
    private String email;
}

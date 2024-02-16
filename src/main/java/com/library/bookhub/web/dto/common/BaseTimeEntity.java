package com.library.bookhub.web.dto.common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BaseTimeEntity {
	
	 /** 등록일 */
    private String insertTime;

    /** 수정일 */
    private String updateTime;

    /** 기본 생성자 */
    public BaseTimeEntity() {
        // todo) 생성시 현재날짜 넣기 : yyyy-MM-dd HH:mm:ss
        this.insertTime = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        this.updateTime = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }


}

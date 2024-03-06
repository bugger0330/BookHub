package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * 배너 광고 엔티티
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BannerAd {

    private Long id;
    private String title;
    private String content;
    private String writer;
    private String originFileName;
    private String uploadFileName;
    private String postYn;
    private Long clicks;
    private Timestamp createdAt;

    public String setupAdImage(){
        return uploadFileName == null ? "이미지가 없습니다." : "/images/upload/" + uploadFileName;
    }
    
 // 클릭 수 증가 메소드
    public void increaseClicks() {
        this.clicks++;
    }

}

package com.library.bookhub.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

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
    private Timestamp createdAt;

    public String setupAdImage(){
        return uploadFileName == null ? "이미지가 없습니다." : "/images/upload/" + uploadFileName;
    }

}

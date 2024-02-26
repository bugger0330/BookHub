package com.library.bookhub.web.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * 배너광고 등록 폼 DTO
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BannerAdFormDto {

    private String title;
    private String content;
    private String writer;
    private String postYn;

    // 파일처리
    private String originFileName;
    private String uploadFileName;
    private MultipartFile bannerImage;
}

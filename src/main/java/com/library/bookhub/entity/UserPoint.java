package com.library.bookhub.entity;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사용자 포인트 정보 엔티티(관리자)
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserPoint {
    private Long id; 
    private String userId; // 유저 식별자
    private String pointName; // 포인트 식별자
    private LocalDateTime purchaseDate; // 구매일시
    private int point; // 포인트
    private int price; // 가격
    private String refundYn; // 환불여부
    private String impUid; // 결제 고유번호
    private String merchantUid; // 주문번호


    // 포메터 기능(금액)
    public String formatBalancePrice() {
        // 1000 -> 1,000
        DecimalFormat df = new DecimalFormat("#,###");
        String formaterNumber = df.format(price);
        return formaterNumber + " 원";
    }

    // 포메터 기능(포인트)
    public String formatBalancePoint() {
        // 1000 -> 1,000
        DecimalFormat df = new DecimalFormat("#,###");
        String formaterNumber = df.format(point);
        return formaterNumber + " 포인트";
    }



    // 포메터 기능(날짜)
    public String formatDateTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초");
        return purchaseDate.format(formatter);
    }
}

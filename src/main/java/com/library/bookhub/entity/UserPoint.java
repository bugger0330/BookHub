package com.library.bookhub.entity;

import java.time.LocalDateTime;
import java.time.ZoneId;

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
    private Long id; // 구독 정보 식별자
    private String userId; // 유저 식별자
    private String pointName; // 구독 요금제 식별자
    private LocalDateTime purchaseDate; // 구매일시
    private int point; // 포인트
    private String refundYn; // 환불여부
    private String impUid; // 결제 고유번호
    private String merchantUid; // 주문번호
}

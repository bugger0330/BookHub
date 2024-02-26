package com.library.bookhub.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사용자 구독 정보 엔티티(관리자)
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSubscription {
    private Long id; // 구독 정보 식별자
    private String userId; // 유저 식별자
    private Long subscriptionProductId; // 구독 요금제 식별자
    private LocalDateTime purchaseDate; // 구매일시
    private int period; // 구독 기간 (월 단위 등)
    private LocalDateTime startDate; // 구독 시작일
    private LocalDateTime endDate; // 구독 종료일
    private String refundYn; // 환불여부


   
}



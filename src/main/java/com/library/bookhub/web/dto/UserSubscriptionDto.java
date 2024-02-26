package com.library.bookhub.web.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 유저 구독 DTO
 * @Author : 이준혁
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserSubscriptionDto {

    private Long id;
    private Long spId;
    private String userId;
    private String prodName;
    private Long price;
    private int period;
    private LocalDateTime startDate; // 구독 시작일
    private LocalDateTime endDate; // 구독 종료일
    private LocalDateTime purchaseDate; // 구매일
    private String refundYn; // 환불여부

    
    
    
	
	// 포메터 기능
		public String formatBalance() {
			// 1000 -> 1,000
			DecimalFormat df = new DecimalFormat("#,###");
			String formaterNumber = df.format(price);
			return formaterNumber + "원";
		}

    
    public String getStartDateStr(){
        return formatDate(startDate);
    }

    public String getEndDateStr(){
        return formatDate(endDate);
    }

    public String getPurchaseDateStr(){
        return formatDate(purchaseDate);
    }

    private String formatDate(LocalDateTime dateTime) {
        if (dateTime == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시mm분ss초");
            return dateTime.format(formatter);
        }
    }
}

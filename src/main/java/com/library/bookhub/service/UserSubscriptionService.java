package com.library.bookhub.service;

import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserSubscription;
import com.library.bookhub.repository.UserSubscriptionRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 사용자 구독 서비스
 * @Author : 이준혁
 */
@Service
public class UserSubscriptionService {

    @Autowired
    private UserSubscriptionRepository userSubscriptionRepository;


    // 구독 정보 저장
    public void save(UserSubscription userSubscription) {
        userSubscriptionRepository.save(userSubscription);
    }


    // 페이징된 유저구독 목록 조회
    public PageRes<UserSubscription> getUserSubscriptionsWithPaging(PageReq pageReq, String userId) {
        int page = pageReq.getPage();
        int size = pageReq.getSize();
        int offset = (page - 1) * size; // 오프셋 계산

        // 총 데이터 개수 조회
        long totalElements = userSubscriptionRepository.getTotalCount();

        // 페이징 처리된 유저 목록 조회
        List<UserSubscription> users = userSubscriptionRepository.findAllWithPagingAndUserId(offset, size, userId);

        // 페이징 결과 객체 생성
        PageRes<UserSubscription> pageRes = new PageRes<>(users, page, totalElements, size);

        return pageRes;
    }

}

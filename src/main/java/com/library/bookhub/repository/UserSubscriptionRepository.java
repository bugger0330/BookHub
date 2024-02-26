package com.library.bookhub.repository;

import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserSubscription;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 사용자 구독 레포지토리
 * @Author : 이준혁
 */
@Mapper
public interface UserSubscriptionRepository {

    // 저장함수
    public void save(UserSubscription userSubscription);

    // 전체조회, 페이징처리
    public List<UserSubscription> findAllWithPagingAndUserId(@Param("offset") int offset, @Param("limit") int limit, @Param("userId") String userId);


    // 총 데이터의 개수 조회
    public long getTotalCount();

}

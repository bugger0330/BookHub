package com.library.bookhub.repository;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.User;

@Mapper
public interface MyPageRepository {

	// 회원 상세 조회
    User findById(int id);

    // 회원 수정
    int myPageUpdate(User user);

    // 회원 탈퇴
    int myPageDeleteById(User user);

}
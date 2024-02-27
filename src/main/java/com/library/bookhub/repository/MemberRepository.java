package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.User;


@Mapper
public interface MemberRepository {
	
	// 계정 등록
	public int insert(User member);
	
	// 계정 정보 조회
	public User findByUsername(String username);
	
	// 아이디 중복 조회
	public int countByUsername(String username);
	
	// 이메일로 아이디 찾기
	public List<String> findEmailByUsername(String email);
}
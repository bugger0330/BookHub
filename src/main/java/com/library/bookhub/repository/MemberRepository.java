package com.library.bookhub.repository;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.User;

@Mapper
public interface MemberRepository {
	
	public int insert(User member);
	
	public User findByUsername(String username);
}

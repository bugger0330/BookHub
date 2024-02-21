package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.User;


@Mapper
public interface MemberRepository {
	
	public int insert(User member);
	
	public User findByUsername(String username);
	
	public int countByUsername(String username);
	public List<User> findEmailByUsername(String email);
}

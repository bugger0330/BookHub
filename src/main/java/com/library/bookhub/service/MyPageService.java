package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.User;
import com.library.bookhub.repository.MyPageRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageService {

	@Autowired
	private MyPageRepository myPageRepository;

	// 상세 조회
	public User findById(Long id) {
		return myPageRepository.findById(id);
	}

	// 수정
	public int update(User user) {

		return myPageRepository.myPageUpdate(user);
	}

	// 삭제
	public int deleteById(User user) {
		return myPageRepository.myPageDeleteById(user);
	}

}
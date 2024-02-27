package com.library.bookhub.service;

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
	public User findById(int id) {
		return myPageRepository.findById(id);
	}

	// 저장
	public int save(User user) {

		return myPageRepository.myPageUpdate(user);

	}

	// 삭제
	public int deleteById(User user) {
		return myPageRepository.myPageDeleteById(user);
	}

}
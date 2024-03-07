package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.repository.cs.CsFaqRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsFaqService {
	
	@Autowired
	private CsFaqRepository csFaqRepository;

	// 자주 묻는 질문 리스트
	public List<CsFaqEntity> selectCsFaqList() {
		return csFaqRepository.selectCsFaqList();
	}
	
	
	
	
}

package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.repository.cs.CsFaqRepository;
import com.library.bookhub.repository.cs.CsNoticeRepository;
import com.library.bookhub.repository.cs.CsQnaRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsService {

	@Autowired
	private CsNoticeRepository csNoticeRepository;

	@Autowired
	private CsQnaRepository csQnaRepository;

	@Autowired
	private CsFaqRepository csFaqRepository;

	// 공지사항 리스트
	public List<CsNoticeEntity> selectCsNoticeList() {
		return csNoticeRepository.selectCsNoticeList();
	}

	// 문의하기 리스트
	public List<CsQnaEntity> selectCsQnaList() {
		return csQnaRepository.selectCsQnaList();
	}

	// 자주 묻는 질문 리스트
	public List<CsFaqEntity> selectCsFaqList() {
		return csFaqRepository.selectCsFaqList();
	}

}

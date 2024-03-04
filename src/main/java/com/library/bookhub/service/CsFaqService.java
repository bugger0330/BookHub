package com.library.bookhub.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.library.bookhub.entity.cs.CsFaqEntity;
import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.repository.cs.CsFaqRepository;
import com.library.bookhub.repository.cs.CsNoticeRepository;
import com.library.bookhub.repository.cs.CsQnaRepository;
import com.library.bookhub.web.dto.cs.CsQnaDto;
import com.library.bookhub.web.dto.cs.PageReq;
import com.library.bookhub.web.dto.cs.PageRes;

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

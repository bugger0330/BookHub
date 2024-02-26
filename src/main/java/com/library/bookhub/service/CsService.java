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
import com.library.bookhub.web.dto.cs.CsQnaDto;

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

	// 문의하기 작성하기
	public boolean qnaInsert(CsQnaDto dto) {
		CsQnaEntity csQnaEntity = new CsQnaEntity();
		csQnaEntity.setTitle(dto.getTitle());
		csQnaEntity.setContent(dto.getContent());

		int result = csQnaRepository.qnaInsert(csQnaEntity);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// 문의하기 상세보기
	public CsQnaEntity qnaView(int id) {

		return csQnaRepository.qnaView(id);
	}

	// 문의하기 수정하기
	public boolean qnaUpdate(int id, CsQnaDto dto) {

		CsQnaEntity csQnaEntity = CsQnaEntity.builder()
				.title(dto.getTitle())
				.content(dto.getContent())
				.id(id)
				.build();

		int result = csQnaRepository.qnaUpdate(csQnaEntity);


		if (result == 1) {
			return true;
		}

		return false;
	}

	// 문의하기 삭제하기
	public boolean qnaDelete(int id) {

		int result = csQnaRepository.qnaDelete(id);

		if (result == 1) {
			return true;
		}

		return false;
	}

}

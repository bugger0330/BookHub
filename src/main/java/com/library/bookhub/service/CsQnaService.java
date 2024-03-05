package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.repository.cs.CsQnaRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import com.library.bookhub.web.dto.cs.CsQnaDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsQnaService {


	@Autowired
	private CsQnaRepository csQnaRepository;

	
	
	// Qna 리스트
	public List<CsQnaEntity> selectCsQnaList() {
		return csQnaRepository.selectCsQnaList();
	}

	// Qna 작성하기
	public boolean qnaInsert(CsQnaDto dto , String filepath) {
		
		System.out.println("인서트 서비스"+ dto.getFilepath());
		
		CsQnaEntity csQnaEntity = CsQnaEntity.builder()
				.title(dto.getTitle())
				.content(dto.getContent())
				.filepath(filepath)
				.build();

		int result = csQnaRepository.qnaInsert(csQnaEntity);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// Qna 상세보기
	public CsQnaEntity qnaView(int id) {

		return csQnaRepository.qnaView(id);
	}

	// Qna 수정하기
	public boolean qnaUpdate(int id, CsQnaDto dto) {

		CsQnaEntity csQnaEntity = CsQnaEntity.builder().title(dto.getTitle()).content(dto.getContent()).id(id).build();

		int result = csQnaRepository.qnaUpdate(csQnaEntity);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// Qna 삭제하기
	public boolean qnaDelete(int id) {

		int result = csQnaRepository.qnaDelete(id);

		if (result == 1) {
			return true;
		}

		return false;
	}


	// Qna 페이징 처리 - 총 게시글 수 조회
	public int getTotalQnaCount() {
		return csQnaRepository.getAllPgCount();
	}

	// Qna 페이징 된 글 목록 조회
	public PageRes<CsQnaEntity> getQnaUsingPage(PageReq pageReq) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산
		// 총 데이터 개수 조회
		long totalElements = csQnaRepository.getAllPgCount();
		
		// 페이징 처리된 목록 조회
		List<CsQnaEntity> boardList = csQnaRepository.findAllwithPasing(offset, size);
		
		// 페이징 결과 객체 생성
		PageRes<CsQnaEntity> pageRes = new PageRes<>(boardList ,page, totalElements, size);
		
		return pageRes;
	}
	
	
}

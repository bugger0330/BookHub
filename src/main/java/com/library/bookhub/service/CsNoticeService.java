package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.repository.cs.CsNoticeRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import com.library.bookhub.web.dto.cs.CsNoticeDto;
import com.library.bookhub.web.dto.cs.CsQnaDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsNoticeService {

	@Autowired
	private CsNoticeRepository csNoticeRepository;

	
	 // Notice 리스트 메인화면 
	public List<CsNoticeEntity> selectCsNoticeList() { return
	 csNoticeRepository.noticeList(); }
	 

	// Notice 상세보기
	public CsNoticeEntity noticeView(int id) {

		return csNoticeRepository.noticeView(id);
	}

	// Notice 작성하기
	public boolean noticeInsert(CsNoticeDto dto, String filepath) {

		System.out.println("인서트 서비스" + dto.getFilepath());

		CsNoticeEntity csNoticeEntity = CsNoticeEntity.builder().title(dto.getTitle()).content(dto.getContent())
				.filepath(filepath).build();

		int result = csNoticeRepository.noticeInsert(csNoticeEntity);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// Notice 삭제하기
	public boolean noticeDelete(int id) {

		int result = csNoticeRepository.noticeDelete(id);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// Notice 페이징 처리 - 총 게시글 수 조회
	public int getTotalNoticeCount() {
		return csNoticeRepository.getAllPgCount();
	}

	// Notice 페이징 된 글 목록 조회
	public PageRes<CsNoticeEntity> getNoticeUsingPage(PageReq pageReq) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산
		// 총 데이터 개수 조회
		long totalElements = csNoticeRepository.getAllPgCount();

		// 페이징 처리된 목록 조회
		List<CsNoticeEntity> boardList = csNoticeRepository.findAllwithPasing(offset, size);

		// 페이징 결과 객체 생성
		PageRes<CsNoticeEntity> pageRes = new PageRes<>(boardList, page, totalElements, size);

		return pageRes;
	}

	/*
	 * Notice 수정 public void updateCsNotice(CsNoticeEntity notice) {
	 * csNoticeRepository.updateCsNotice(notice); }
	 */

	
	// Notice 검색
	public List<CsNoticeEntity> noticeSearchPage(String searchType, String searchInput) {

		return csNoticeRepository.noticeSearchPage(searchType, searchInput);
	}

	public List<CsNoticeEntity> noticeList() {

		return csNoticeRepository.noticeList();
	}

}

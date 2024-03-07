package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.entity.cs.CsQnaReplyEntity;
import com.library.bookhub.repository.cs.CsQnaReplyRepository;
import com.library.bookhub.repository.cs.CsQnaRepository;
import com.library.bookhub.web.dto.cs.CsQnaReplyDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsQnaReplyService {

	@Autowired
	private CsQnaReplyRepository csQnaReplyRepository;

	@Autowired
	private CsQnaRepository csQnaRepository;

	// QnaReply 리스트
	public List<CsQnaReplyEntity> selectCsQnaReplyList() {
		return csQnaReplyRepository.selectCsQnaReplyList();
	}

	// QnaReply 작성하기
	@Transactional
	public boolean qnaReplyInsertAndUpdateQna(CsQnaReplyDto dto, int qnaId, String userId) {

		CsQnaEntity csQnaEntity = csQnaRepository.qnaView(qnaId);

		CsQnaReplyEntity csQnaReplyEntity = CsQnaReplyEntity.builder().content(dto.getContent()).writer(userId)
				.qnaId(dto.getQnaId()).build();

		int result = csQnaReplyRepository.qnaReplyInsertAndUpdateQna(csQnaReplyEntity);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// QnaReply 삭제하기
	public boolean qnaReplyDelete(int id) {

		int result = csQnaReplyRepository.qnaReplyDelete(id);

		if (result == 1) {
			return true;
		}

		return false;
	}

	// QnaReply 상세보기
	public CsQnaReplyEntity qnaReplyView(int qnaId) {

		System.out.println(" 서비스 " + qnaId);
		
		return csQnaReplyRepository.qnaReplyView(qnaId);
	}

}

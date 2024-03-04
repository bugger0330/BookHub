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
	public boolean qnaReplyInsert(CsQnaReplyDto dto, int qnaId) {
		
		CsQnaEntity csQnaEntity = csQnaRepository.qnaView(qnaId);
		
		CsQnaReplyEntity csQnaReplyEntity = CsQnaReplyEntity.builder()
				.content(dto.getContent())
				.writer(dto.getWriter())
				.qnaId(dto.getQnaId())
				.build();

		int result = csQnaReplyRepository.qnaReplyInsert(csQnaReplyEntity);

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
	
}

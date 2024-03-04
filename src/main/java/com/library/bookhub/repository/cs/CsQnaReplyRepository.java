package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.entity.cs.CsQnaReplyEntity;
import com.library.bookhub.web.dto.cs.CsQnaDto;

@Mapper
public interface CsQnaReplyRepository {

	// QnaReply 리스트
	public List<CsQnaReplyEntity> selectCsQnaReplyList();

	// QnaReply 작성
	public int qnaReplyInsert(CsQnaReplyEntity csQnaReplyEntity);

	// QnaReply 삭제하기
	public int qnaReplyDelete(int id);
}

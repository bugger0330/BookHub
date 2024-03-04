package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.cs.CsQnaEntity;
import com.library.bookhub.web.dto.cs.CsQnaDto;

@Mapper
public interface CsQnaRepository {

	// Qna 리스트
	public List<CsQnaEntity> selectCsQnaList();

	// Qna 작성
	public int qnaInsert(CsQnaEntity csQnaEntity);

	// Qna 상세보기
	public CsQnaEntity qnaView(int id);

	// Qna 수정하기
	public int qnaUpdate(CsQnaEntity csQnaEntity);

	// Qna 삭제하기
	public int qnaDelete(int id);
	
	// 전체 페이지 불러오기
	public List<CsQnaEntity> findAllwithPasing(@Param ("offset") int offset, @Param ("limit") int limit);
	
	// 전체 게시물개수 계산 
	public int getAllPgCount();

	// Qna 파일업로드
	public int saveFiledb(CsQnaDto csQnaDto);
	
}

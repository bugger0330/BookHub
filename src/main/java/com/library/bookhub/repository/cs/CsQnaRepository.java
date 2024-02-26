package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsQnaEntity;

@Mapper
public interface CsQnaRepository {

	// 문의하기 리스트
	public List<CsQnaEntity> selectCsQnaList();

	// 문의하기 작성
	public int qnaInsert(CsQnaEntity csQnaEntity);

	// 문의하기 상세보기
	public CsQnaEntity qnaView(int id);

	// 문의하기 수정하기
	public int qnaUpdate(CsQnaEntity csQnaEntity);

	// 문의하기 삭제하기
	public int qnaDelete(int id);

}

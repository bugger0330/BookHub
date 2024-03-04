package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.cs.CsNoticeEntity;

@Mapper
public interface CsNoticeRepository {

	// Notice 리스트
	public List<CsNoticeEntity> selectCsNoticeList();

	// Notice 상세보기
	public CsNoticeEntity noticeView(int id);

	// 전체 페이지 불러오기
	public List<CsNoticeEntity> findAllwithPasing(@Param("offset") int offset, @Param("limit") int limit);

	// 전체 게시물개수 계산 
	public int getAllPgCount();

}

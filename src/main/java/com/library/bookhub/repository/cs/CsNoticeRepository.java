package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.entity.cs.CsQnaEntity;

@Mapper
public interface CsNoticeRepository {

	// Notice 리스트
	// public List<CsNoticeEntity> selectCsNoticeList();

	// Notice 상세보기
	public CsNoticeEntity noticeView(int id);

	// 전체 페이지 불러오기
	public List<CsNoticeEntity> findAllwithPasing(@Param("offset") int offset, @Param("limit") int limit);

	// 전체 게시물개수 계산 
	public int getAllPgCount();
	
	
	// Notice 작성
	public int noticeInsert(CsNoticeEntity csNoticeEntity);
	
	// Notice 삭제하기
	public int noticeDelete(int id);
    
	/*
	 * 공지사항 수정 void updateCsNotice(CsNoticeEntity notice);
	 */

    // 추가 강민 공지사항 리스트 불러오기
	public List<CsNoticeEntity> noticeSearchPage(@Param("searchType") String searchType, @Param("searchInput") String searchInput);
	// 추가 전체 리스트
	public List<CsNoticeEntity> noticeList();

}
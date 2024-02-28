package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.cs.CsNoticeEntity;

@Mapper
public interface CsNoticeRepository {

	// 공지사항 리스트
	public List<CsNoticeEntity> selectCsNoticeList();

	// 공지사항 상세보기
	public CsNoticeEntity noticeView(int id);

	// 전체 페이지 불러오기
	public List<CsNoticeEntity> findAllwithPasing(@Param("offset") int offset, @Param("limit") int limit);

	// 전체 게시물개수 계산 (product에서 가져옴)
	public int getAllPgCount();

}

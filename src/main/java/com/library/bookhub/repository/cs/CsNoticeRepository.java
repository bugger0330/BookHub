package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsNoticeEntity;

@Mapper
public interface CsNoticeRepository {

	// 공지사항 리스트
	public List<CsNoticeEntity> selectCsNoticeList();

	// 공지사항 상세보기
	public CsNoticeEntity noticeView(int id);

}

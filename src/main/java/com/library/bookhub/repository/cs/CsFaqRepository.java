package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsFaqEntity;

@Mapper
public interface CsFaqRepository {
	
	// 자주 묻는 질문 리스트
	public List<CsFaqEntity> selectCsFaqList();

}

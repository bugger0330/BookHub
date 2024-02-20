package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsQnaEntity;

@Mapper
public interface CsQnaRepository {
	
	// 문의사항 리스트
	public List<CsQnaEntity> selectCsQnaList();

}

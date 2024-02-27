package com.library.bookhub.repository.cs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.entity.cs.CsFaqEntity;

@Mapper
public interface CsCateRepository {

	// 1차 카테고리 리스트
	public List<CsCate1Entity> selectCsCate1(); 
		
	// 2차 카테고리 리스트
	public List<CsCate2Entity> selectCsCate2(int cate1);
	
}

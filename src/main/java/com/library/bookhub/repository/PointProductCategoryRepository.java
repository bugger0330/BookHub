package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.PointProductCategory;

/**
 * 포인트 상품 카테고리 레포지토리
 * @Author : 이준혁
 */
@Mapper
public interface PointProductCategoryRepository {
	
	
	// 전체조회 페이징 처리
	public List<PointProductCategory> findAllWithPagingAndCategoryName(@Param("offset") int offset, @Param("limit") int limit, @Param("categoryName") String categoryName);
	
	// 저장
	public int insert(PointProductCategory pointProductCategory);
	// 수정
	public int update(PointProductCategory pointProductCategory);
	// 삭제
	public int deleteById(Integer id);
	// id값이 존재하는지 확인
	public long existById(int id);
	// id로 조회
	public List<PointProductCategory> findById(Integer id);
	// 총 데이터의 개수 조회
	public int getCount();
	
	

}

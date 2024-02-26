package com.library.bookhub.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.PointProduct;

/**
 * 포인트 상품 레포지토리
 * @Author : 이준혁
 */
@Mapper
public interface PointProductRepository {
	
	public int insert(PointProduct pointProduct);
	public int update(PointProduct pointProduct);
	public int deleteById(Integer id);
	public long existById(int id);
	public List<PointProduct> findById(Integer id);
	
	// 총 데이터의 개수 조회
    public int getPointProductTotalCount();
	
	// 전체조회 페이징 처리
	public List<PointProduct> findAllWithPagingAndProductName(@Param("offset") int offset, @Param("limit") int limit, @Param("prodName") String prodName);
	
	// id 값으로 상품 찾기
	public Optional<PointProduct> findByPointProductId(int id);
	
	// 포인트 상품 게시여부 상태값 변경
	public void updatePostStatus(@Param("id") int id, @Param("postYn") String postYn);

}

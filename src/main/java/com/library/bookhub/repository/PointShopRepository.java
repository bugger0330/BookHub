package com.library.bookhub.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.User;


/**
 * 포인트 상품
 * @Author : 이준혁
 */
@Mapper
public interface PointShopRepository {
	
	
	public List<PointShop> findAll();
	
	// 총 데이터의 개수 조회
    public int getTotalCount();
    
    
    // 전체조회, 페이징처리
 	public List<PointShop> findAllWithPagingAndProdName(@Param("offset") int offset, @Param("limit") int limit, @Param("prodName") String prodName);

    
    
    // 상세조회(1건조회)
    public Optional<PointShop> findById(int id);
    
    // 저장함수
    public int insert(PointShop pointShop);
    
    // 수정함수
    public int update(PointShop pointShop);
    
    // 삭제함수
    public int deleteById(int id);
    
    // 기본키(id)가 있는지 확인하는 조회함수
    public long existById(int id);
    

}

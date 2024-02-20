package com.library.bookhub.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.SubscriptionProduct;

@Mapper
public interface SubscriptionProductRepository {

	// 페이징 처리된 전체조회
	public List<SubscriptionProduct> findAll(@Param("offset") int offset, @Param("limit") int limit);
	
	// 페이징 처리없는 전체조회
	public List<SubscriptionProduct> findAllNoPage();

	// id가 존재하는지 확인
	public long existById(int id);

	// 저장하기
	public int insert(SubscriptionProduct subscriptionProduct);

	// 수정하기
	public int update(SubscriptionProduct subscriptionProduct);

	// 삭제하기
	public int deleteById(Integer id);

	// 총 데이터의 개수 조회
	public int getProductTotalCount();

	// 상품 찾기
	Optional<SubscriptionProduct> findByProductId(int id);
}

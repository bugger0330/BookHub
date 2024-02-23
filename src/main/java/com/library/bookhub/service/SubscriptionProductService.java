package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.SubscriptionProduct;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.SubscriptionProductRepository;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubscriptionProductService {

	@Autowired
	private SubscriptionProductRepository subscriptionProductRepository;

	public SubscriptionProductService(SubscriptionProductRepository subscriptionProductRepository) {
		this.subscriptionProductRepository = subscriptionProductRepository;
	}

	// 상품등록
	@Transactional
	public void saveSubProduct(SubscriptionProduct product) {
		SubscriptionProduct subscriptionProduct = SubscriptionProduct.builder().prodName(product.getProdName())
				.price(product.getPrice()).period(product.getPeriod()).build();

		int result = subscriptionProductRepository.insert(subscriptionProduct);
		if (result != 1) {
			throw new CustomRestFulException(Define.FAIL_UPLOAD_AD, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 페이징된 상품 목록 조회
	public PageRes<SubscriptionProduct> getProductWithPaging(PageReq pageReq) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = subscriptionProductRepository.getProductTotalCount();

		// 페이징 처리된 유저 목록 조회
		List<SubscriptionProduct> pds = subscriptionProductRepository.findAll(offset, size);

		// 페이징 결과 객체 생성
		PageRes<SubscriptionProduct> pageRes = new PageRes<>(pds, page, totalElements, size);

		return pageRes;
	}
	
	// 페이징 처리 없는 전체조회
	public List<SubscriptionProduct> getProductNoPage(){
		
		List<SubscriptionProduct> pds = subscriptionProductRepository.findAllNoPage();		
		return pds;
	}

	// 상세조회
	public Optional<SubscriptionProduct> findByProductId(int id) {
		// db 상세조회 호출
		Optional<SubscriptionProduct> optionalProduct = subscriptionProductRepository.findByProductId(id);

		return optionalProduct;
	}

	// 수정
	public int save(SubscriptionProduct product) {
		int queryResult = -1;
		try {
			if (product.getSpId() == null) {
				queryResult = subscriptionProductRepository.insert(product);
			} else {
				queryResult = subscriptionProductRepository.update(product);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}

		return queryResult;
	}

	// 삭제함수
	public boolean removeById(int id) {
		try {
			if (subscriptionProductRepository.existById(id) > 0) {
				subscriptionProductRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
		return false;

	}

}
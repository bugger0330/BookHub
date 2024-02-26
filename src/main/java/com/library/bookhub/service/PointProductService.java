package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.PointProduct;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.PointProductRepository;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.PointProductFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

/**
 * 포인트 상품 서비스
 * @Author : 이준혁
 */
@Slf4j
@Service
public class PointProductService {

	@Autowired
	private PointProductRepository pointProductRepository;

	public PointProductService(PointProductRepository pointProductRepository) {
		this.pointProductRepository = pointProductRepository;
	}
	
	// 업로드 처리
		@Transactional
		public void uploadPointProduct(PointProductFormDto dto) {
			PointProduct pointProduct = PointProduct.builder()
					.prodName(dto.getProdName())
					.price(dto.getPrice())
					.point(dto.getPoint())
					.postYn(dto.getPostYn())
					.originFileName(dto.getOriginFileName())
					.uploadFileName(dto.getUploadFileName())
					.build();

			int result = pointProductRepository.insert(pointProduct);
			if (result != 1) {
				throw new CustomRestFulException(Define.FAIL_UPLOAD_AD, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}

	// 페이징된 배너 목록 조회
	public PageRes<PointProduct> getPointProductWithPaging(PageReq pageReq, String productName) {
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size; // 오프셋 계산

		// 총 데이터 개수 조회
		long totalElements = pointProductRepository.getPointProductTotalCount();

		// 페이징 처리된 유저 목록 조회
		List<PointProduct> pps = pointProductRepository.findAllWithPagingAndProductName(offset, size, productName);

		// 페이징 결과 객체 생성
		PageRes<PointProduct> pageRes = new PageRes<>(pps, page, totalElements, size);

		return pageRes;
	}

	// 상세조회
	public Optional<PointProduct> findByProductId(int id) {
		// db 상세조회 호출
		Optional<PointProduct> optionalPointProduct = pointProductRepository.findByPointProductId(id);

		return optionalPointProduct;
	}

	// 수정
	public int save(PointProduct pointProduct) {
		int queryResult = -1;
		try {
			if (pointProduct.getId() == null) {
				queryResult = pointProductRepository.insert(pointProduct);
			} else {
				queryResult = pointProductRepository.update(pointProduct);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}

		return queryResult;
	}

	// 삭제함수
	public boolean removeById(int id) {
		try {
			if (pointProductRepository.existById(id) > 0) {
				pointProductRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
		return false;

	}

	// 광고상태여부 변경
	public void updatePostStatus(int id, String postYn) {
		pointProductRepository.updatePostStatus(id, postYn);
	}

}

package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.repository.PointRepository;
import com.library.bookhub.repository.PointShopRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;


/**
 * 포인트 상품 서비스
 * @Author : 이준혁
 */
@Service
@Slf4j
public class PointShopService {
	
	@Autowired
	private PointShopRepository pointShopRepository;
	
	// 전체조회
	public List<PointShop> findAllPointShop(){
		return pointShopRepository.findAll();
	};
	
	
	// 상세조회(1건조회)
	public Optional<PointShop> findById(int id){
		return pointShopRepository.findById(id);
	}
	
	
	 // 페이징된 포인트상품 목록 조회
 	public PageRes<PointShop> getPointWithPaging(PageReq pageReq, String prodName) {
 		int page = pageReq.getPage();
 		int size = pageReq.getSize();
 		int offset = (page - 1) * size; // 오프셋 계산

 		// 총 데이터 개수 조회
 		long totalElements = pointShopRepository.getTotalCount();

 		// 페이징 처리된 유저 목록 조회
 		List<PointShop> pointProduct = pointShopRepository.findAllWithPagingAndProdName(offset, size, prodName);

 		// 페이징 결과 객체 생성
 		PageRes<PointShop> pageRes = new PageRes<>(pointProduct, page, totalElements, size);

 		return pageRes;
 	}
	
    
    // 저장함수
    public int save(PointShop pointShop) {
    	int queryResult = -1;
    	try {
			if(pointShop.getId() == null) {
				queryResult = pointShopRepository.insert(pointShop);
			} else {
				// 기본키가 없으면
				queryResult = pointShopRepository.update(pointShop);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
    	
    	return queryResult;
    }

    
    // 삭제함수
    public boolean removeById(int id) {
    	try {
			if(pointShopRepository.existById(id) > 0) {
				pointShopRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
    	return false;
    }

}

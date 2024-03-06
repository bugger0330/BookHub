package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.PointProductCategory;
import com.library.bookhub.repository.PointProductCategoryRepository;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

/**
 * 포인트 상품 카테고리 서비스
 * @Author : 이준혁
 */
@Slf4j
@Service
public class PointProductCategoryService {

	
	@Autowired
	private PointProductCategoryRepository pointProductCategoryRepository;

	public PointProductCategoryService(PointProductCategoryRepository pointProductCategoryRepository) {
		this.pointProductCategoryRepository = pointProductCategoryRepository;
	}
	
	
	// 전체조회 - 페이징
	public PageRes<PointProductCategory> getCategoryWithPaging(PageReq pageReq, String categoryName){
		int page = pageReq.getPage();
		int size = pageReq.getSize();
		int offset = (page - 1) * size;
		
		// 총 데이터 개수 조회
		long totalElements = pointProductCategoryRepository.getCount();
		
		// 페이징 된 카테고리 목록 조회
		List<PointProductCategory> categorys = pointProductCategoryRepository.findAllWithPagingAndCategoryName(offset, offset, categoryName);
		
		// 페이징 결과 객체 생성
		PageRes<PointProductCategory> pageRes = new PageRes<>(categorys, page, totalElements, size);
		
		
		return pageRes;
		
	}
	
	// 저장
	public int save(PointProductCategory pointProductCategory) {
		int queryResult = -1;
		try {
			if(pointProductCategory.getCateId() == null) {
				queryResult = pointProductCategoryRepository.insert(pointProductCategory);
			} else {
				// 기본키가 없으면
				queryResult = pointProductCategoryRepository.update(pointProductCategory);
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
		
		return queryResult;
	}
	
	
	 // 삭제함수
    public boolean removeById(int id) {
    	try {
			if(pointProductCategoryRepository.existById(id) > 0) {
				pointProductCategoryRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
    	return false;
    }
	
	
}

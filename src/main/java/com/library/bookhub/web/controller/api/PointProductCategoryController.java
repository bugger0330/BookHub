package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.bookhub.entity.PointProductCategory;
import com.library.bookhub.service.PointProductCategoryService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

/**
 * 포인트 상품 카테고리 컨트롤러
 * @Author : 이준혁
 */
@Slf4j
@Controller
@RequestMapping("/product-category")
public class PointProductCategoryController {

	@Autowired
	private PointProductCategoryService pointProductCategoryService;

	@GetMapping("/list")
	public String getAllCategory(PageReq pageReq, Model model, @RequestParam(required = false) String categoryName) {
		
		// 기본 페이지 및 크기 지정
		if(pageReq.getPage() <= 0) {
			pageReq.setPage(1);
		}
		if(pageReq.getSize() <= 0) {
			pageReq.setSize(10);
		}
		
		// 페이징된 카테고리 목록 가져오기
		PageRes<PointProductCategory> pageRes = pointProductCategoryService.getCategoryWithPaging(pageReq, categoryName);
		List<PointProductCategory> categoryList = pageRes.getContent();
		
		
		// 페이징된 정보를 모델에 추가
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("page", pageReq.getPage());
	    model.addAttribute("size", pageRes.getSize());
	    model.addAttribute("totalPages", pageRes.getTotalPages());
	    model.addAttribute("startPage", pageRes.getStartPage());
	    model.addAttribute("endPage", pageRes.getEndPage());
	    
	    
	    return "pages/admin/categoryList";
	}

}

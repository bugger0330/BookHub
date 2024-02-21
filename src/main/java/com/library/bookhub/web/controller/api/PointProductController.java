package com.library.bookhub.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.bookhub.entity.PointProduct;
import com.library.bookhub.service.PointProductService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/point-product")
public class PointProductController {

	@Autowired
	private PointProductService pointProductService;

	// 포인트 상품 전체조회
	@GetMapping("/list")
	public String getAllPointProduct(PageReq pageReq, Model model, @RequestParam(required = false) String prodName) {

		// 기본 페이지 및 크기 설정
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1);
		}
		if (pageReq.getSize() <= 0) {
			pageReq.setSize(5);
		}

		// 페이징된 상품 목록 가져오기
		PageRes<PointProduct> pageRes = pointProductService.getPointProductWithPaging(pageReq, prodName);
		List<PointProduct> ppdList = pageRes.getContent();

		// 페이징 정보를 모델에 추가
		model.addAttribute("list", ppdList);
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());
		
		return "/pages/admin/pointProductList";
	}

}

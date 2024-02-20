package com.library.bookhub.web.controller.api;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.SubscriptionProduct;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.SubscriptionProductService;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SubscriptionProductController {
	
	@Autowired
	private SubscriptionProductService subscriptionProductService;
	
	// 구독상품 전체조회 (페이징처리)
    @GetMapping("/product-list")
    public String getAllProduct(PageReq pageReq, Model model) {
        // 기본 페이지 및 크기 설정
        if (pageReq.getPage() <= 0) {
            pageReq.setPage(1); // 페이지가 0이하인 경우 첫 페이지로 설정
        }
        if (pageReq.getSize() <= 0) {
            pageReq.setSize(5); // 페이지당 기본 개수 설정
        }

        // 페이징된 유저 목록 가져오기
        PageRes<SubscriptionProduct> pageRes = subscriptionProductService.getProductWithPaging(pageReq);
        List<SubscriptionProduct> productList = pageRes.getContent();


        // 페이징 정보를 모델에 추가
        model.addAttribute("productList", productList);
        model.addAttribute("page", pageReq.getPage());
        model.addAttribute("size", pageRes.getSize());
        model.addAttribute("totalPages", pageRes.getTotalPages());
        model.addAttribute("startPage", pageRes.getStartPage());
        model.addAttribute("endPage", pageRes.getEndPage());

        return "pages/admin/subproductList";
        
    }
    
    // 구독상품 전체조회(페이징X)
    @GetMapping("/sub-product")
    public String getAllProductNoPage(Model model) {
    	
    	List<SubscriptionProduct> list = subscriptionProductService.getProductNoPage();
    	
    	model.addAttribute("productList", list);
    	
    	return "pages/subproduct/subproduct";
    }
    
    
    // 상품 업로드
    @PostMapping("/product-upload")
    public String productUpload(SubscriptionProduct product) {

        // 유효성 검사
        if (product.getProdName() == null || product.getProdName().isEmpty()) {
            throw new CustomRestFulException("상품명을 입력하세요", HttpStatus.BAD_REQUEST);
        }
        if (product.getPrice() == null || product.getPrice() < 0) {
            throw new CustomRestFulException("정확한 금액을 입력하세요", HttpStatus.BAD_REQUEST);
        }
        if (product.getPeriod() == 0 || product.getPrice() < 0) {
            throw new CustomRestFulException("정확한 기간을 입력하세요", HttpStatus.BAD_REQUEST);
        }
       

        subscriptionProductService.saveSubProduct(product);
        return "redirect:/product-list";
    }

	

}

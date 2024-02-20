package com.library.bookhub.web.controller.api;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.library.bookhub.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
import org.springframework.web.servlet.view.RedirectView;

@Controller
@Slf4j
@RequestMapping("/sc-product")
public class SubscriptionProductController {
	
	@Autowired
	private SubscriptionProductService subscriptionProductService;
	
	// 구독상품 전체조회 (페이징처리)
    @GetMapping("/list")
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
    @GetMapping("/nopage")
    public String getAllProductNoPage(Model model) {
    	
    	List<SubscriptionProduct> list = subscriptionProductService.getProductNoPage();
    	
    	model.addAttribute("productList", list);
    	
    	return "pages/subproduct/subproduct";
    }

    // 수정함수 : 수정페이지로 이동 + 상세조회 1건
    @GetMapping("/update/{id}")
    public String editProduct(@PathVariable int id, Model model) {
        // 서비스 상세조회 함수 호출
        Optional<SubscriptionProduct> optionalProduct = subscriptionProductService.findByProductId(id);
        // jsp 전달
        model.addAttribute("product", optionalProduct.get());
        return "pages/admin/subproductUpdate";
    }

    // 수정함수 : db 수정 저장
    @PutMapping("/edit/{id}")
    public RedirectView updateProduct(@PathVariable int id, @ModelAttribute SubscriptionProduct product) {
        // db 수정 저장
        subscriptionProductService.save(product);
        // 전체조회 페이지로 이동
        return new RedirectView("/sc-product/list");
    }



    // 상품 업로드
    @PostMapping("/upload")
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
        return "redirect:/sc-product/list";
    }

    // 삭제함수
    @DeleteMapping("/delete/{id}")
    public RedirectView deleteProduct(@PathVariable int id) {
        subscriptionProductService.removeById(id);
        return new RedirectView("/sc-product/list");
    }
	

}

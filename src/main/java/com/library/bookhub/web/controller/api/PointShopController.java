package com.library.bookhub.web.controller.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.PointShopService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PointShopController {

	@Autowired
	private PointShopService pointShopService;

	// 메인페이지 포인트 상품 상세조회
	@GetMapping("/point-shop/detail/{id}")
	public String pointDetail(@PathVariable int id, Model model) {

		// 서비스 상세조회 호출
		Optional<PointShop> optionalPointShop = pointShopService.findById(id);
		model.addAttribute("list", optionalPointShop.get());

		// 현재 로그인한 사용자의 정보를 가져옴
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 인증 객체로부터 사용자의 정보를 추출하여 sysout으로 출력
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			System.out.println("현재 로그인한 사용자: " + username);

			// 사용자의 이름을 모델에 추가
			model.addAttribute("username", username);
		}
		return "pages/pointshop/pointshopdetail";
	}

	@GetMapping("/point-shop/admin/list")
	public String getAllUsers(PageReq pageReq, Model model, @RequestParam(required = false) String prodName) {
		// 기본 페이지 및 크기 설정
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1); // 페이지가 0이하인 경우 첫 페이지로 설정
		}
		if (pageReq.getSize() <= 0) {
			pageReq.setSize(10); // 페이지당 기본 개수 설정
		}

		// 페이징된 유저 목록 가져오기
		PageRes<PointShop> pageRes = pointShopService.getPointWithPaging(pageReq, prodName);
		List<PointShop> productList = pageRes.getContent();

		// 페이징 정보를 모델에 추가
		model.addAttribute("productList", productList);
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		return "pages/admin/userPointProductBuyList";
	}

	// 상세조회
	@GetMapping("/point-shop/details/{id}")
	public String getUserId(@PathVariable int id, Model model) {
		// 서비스 상세조회 호출
		Optional<PointShop> optionalPointProduct = pointShopService.findById(id);
		model.addAttribute("product", optionalPointProduct.get());

		return "pages/admin/userdetail";
	}

	// 상품 업로드
	@PostMapping("/point-shop/upload")
	public String pointShopUpload(PointShop pointShop) {

		// 유효성 검사
		if (pointShop.getProdName() == null || pointShop.getProdName().isEmpty()) {
			throw new CustomRestFulException("상품명을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (pointShop.getPoint() == 0) {
			throw new CustomRestFulException("포인트 입력은 필수입니다.", HttpStatus.BAD_REQUEST);
		}
		if (pointShop.getPrice() == 0) {
			throw new CustomRestFulException("금액 입력은 필수입니다.", HttpStatus.BAD_REQUEST);
		}

		pointShopService.save(pointShop);
		return "redirect:/point-shop/admin/list";
	}

	// 수정함수 : 수정페이지로 이동 + 상세조회 1건
	@GetMapping("/point-shop/update/{id}")
	public String editPoint(@PathVariable int id, Model model) {
		// 상세조회 호출
		Optional<PointShop> optionalPoint = pointShopService.findById(id);
		model.addAttribute("point", optionalPoint.get());

		return "pages/admin/userPointProductBuyDetail";
	}

	// 수정함수 : db 수정 저장
	@PutMapping("/point-shop/edit/{id}")
	public RedirectView updatePoint(@PathVariable int id, @ModelAttribute PointShop pointShop) {

		// 유효성 검사
		if (pointShop.getProdName() == null || pointShop.getProdName().isEmpty()) {
			throw new CustomRestFulException("상품명을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (pointShop.getPoint() == 0) {
			throw new CustomRestFulException("포인트 입력은 필수입니다.", HttpStatus.BAD_REQUEST);
		}
		if (pointShop.getPrice() == 0) {
			throw new CustomRestFulException("금액 입력은 필수입니다.", HttpStatus.BAD_REQUEST);
		}

		// db 수정 저장
		pointShopService.save(pointShop);
		// 전체조회 페이지로 이동
		return new RedirectView("/point-shop/admin/list");

	}

	// 삭제함수
	@DeleteMapping("/point-shop/delete/{id}")
	public RedirectView deletePoint(@PathVariable int id) {
		pointShopService.removeById(id);
		return new RedirectView("/point-shop/admin/list");
	}

}

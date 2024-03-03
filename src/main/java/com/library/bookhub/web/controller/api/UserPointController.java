package com.library.bookhub.web.controller.api;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.library.bookhub.entity.PointProduct;
import com.library.bookhub.entity.User;
import com.library.bookhub.entity.UserPoint;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.UserPointService;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.PointProductFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/user-point")
public class UserPointController {
	
	@Autowired
	private UserPointService userPointService;
	
	
	// 포인트 상품 전체조회
		@GetMapping("/list")
		public String getAllPointProduct(PageReq pageReq, Model model, @RequestParam(required = false) String userId) {

			// 기본 페이지 및 크기 설정
			if (pageReq.getPage() <= 0) {
				pageReq.setPage(1);
			}
			if (pageReq.getSize() <= 0) {
				pageReq.setSize(5);
			}

			// 페이징된 상품 목록 가져오기
			PageRes<UserPoint> pageRes = userPointService.getPointWithPaging(pageReq, userId);
			List<UserPoint> pointList = pageRes.getContent();

			// 페이징 정보를 모델에 추가
			model.addAttribute("pointList", pointList);
			model.addAttribute("page", pageReq.getPage());
			model.addAttribute("size", pageRes.getSize());
			model.addAttribute("totalPages", pageRes.getTotalPages());
			model.addAttribute("startPage", pageRes.getStartPage());
			model.addAttribute("endPage", pageRes.getEndPage());

			return "/pages/admin/userPointBuyList";
		}
		
		
		
		// 환불요청 조회
		@GetMapping("/refund")
		public String getRefund(Model model) {
			List<UserPoint> list = userPointService.refundReq();
			
			model.addAttribute("list", list);
			
			return "/pages/admin/refundList";
		}
		
		

}

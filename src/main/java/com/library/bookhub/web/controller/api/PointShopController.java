package com.library.bookhub.web.controller.api;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.User;
import com.library.bookhub.service.PointShopService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PointShopController {
	
	
	@Autowired
	private PointShopService pointShopService;
	
	
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
	
	

}


package com.library.bookhub.web.controller.api;


import com.library.bookhub.entity.User;
import com.library.bookhub.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.SubscriptionProduct;
import com.library.bookhub.service.SubscriptionProductService;
import java.util.Optional;

/**
 * 결제 컨트롤러
 * @Author : 이준혁
 */
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private SubscriptionProductService subscriptionProductService;

	@Autowired
	private UserService userService;
	
	
	// 구독 상품 내역 보내기
	 @GetMapping("/detail/{id}")
	    public String detailProduct(@PathVariable int id, Model model) {
	        // 서비스 상세조회 함수 호출
	        Optional<SubscriptionProduct> optionalProduct = subscriptionProductService.findByProductId(id);
	        // jsp 전달
	        model.addAttribute("product", optionalProduct.get());

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
	        return "pages/payment/paymentTest";
	    }


	// success 페이지에 유저 정보 및 구독 상품 내역 전달
	@GetMapping("/success/{id}")
	@Transactional
	public String successPage(@PathVariable int id, Model model) {
		// 현재 로그인한 사용자의 정보를 가져옴
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 인증 객체로부터 사용자의 정보를 추출하여 출력
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			System.out.println("현재 로그인한 사용자: " + username);

			// 사용자의 이름을 모델에 추가
			model.addAttribute("username", username);
		}

		// 구독 상품 내역을 가져와서 모델에 추가
		Optional<SubscriptionProduct> optionalProduct = subscriptionProductService.findByProductId(id);
		if (optionalProduct.isPresent()) {
			SubscriptionProduct product = optionalProduct.get();
			model.addAttribute("product", product);
			System.out.println("구독 상품 정보: " + product);
		} else {
			// 상품을 찾을 수 없는 경우 에러 페이지 또는 다른 처리를 수행할 수 있습니다.
			return "error";
		}

		return "pages/payment/paymentSuccess";
	}


	



}

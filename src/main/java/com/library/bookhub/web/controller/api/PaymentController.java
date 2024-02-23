
package com.library.bookhub.web.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.bookhub.entity.SubscriptionProduct;
import com.library.bookhub.service.SubscriptionProductService;
import java.util.Optional;
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private SubscriptionProductService subscriptionProductService;
	
	
	// 구독 상품 내역 보내기
	 @GetMapping("/detail/{id}")
	    public String detailProduct(@PathVariable int id, Model model) {
	        // 서비스 상세조회 함수 호출
	        Optional<SubscriptionProduct> optionalProduct = subscriptionProductService.findByProductId(id);
	        // jsp 전달
	        model.addAttribute("product", optionalProduct.get());
	        return "pages/payment/paymentTest";
	    }
	  

	  
}

package com.library.bookhub.web.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	// ---------------- 메인 페이지 ----------------//

	// 로그인페이지
	@GetMapping("/login")
	public String loginPage() {

		return "pages/user/login";
	}

	// about 페이지
	@GetMapping("/about")
	public String aboutPage() {

		return "pages/about/about";
	}

	// 도서 통합검색 페이지
	@GetMapping("/search")
	public String searchPage() {

		return "pages/book/search";
	}

	// 추천도서 페이지
	@GetMapping("/suggest")
	public String suggestPage() {
		return "pages/book/suggest";
	}

	// 추천도서 페이지
	@GetMapping("/ad-inquiry")
	public String adInquiryPage() {
		return "pages/openArea/advertisingInquiry";
	}
	
	// 포인트샵
	@GetMapping("/point-shop")
	public String pointShopPage() {
		return "pages/pointshop/pointshop";
	}
	
	// 포인트샵 상세페이지
	@GetMapping("/point-shop/payment")
	public String pointShopDetailPage() {
		return "pages/pointshop/pointshopdetail";
	}
	
	// 결제페이지 - 결제성공
	@GetMapping("/success")
	public String paymentSuccessPage() {
		return "pages/payment/paymentSuccess";
	}

	// 결제페이지 - 결제실패
	@GetMapping("/fail")
	public String paymentFailPage() {
		return "pages/payment/fail";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String myPage() {
		return "pages/myPage/myPageDetail";
	}

	// ---------------- 관리자 페이지 ----------------//

	// 접근거부 페이지
	@GetMapping("/access-denied")
	public String deninedPage() {
		return "pages/error/access-denied";
	}

	// 어드민 페이지
	@GetMapping("/admin")
	public String adminPage() {
		return "pages/admin/main";
	}

	// 관리자페이지 - 회원관리
	@GetMapping("/userlist")
	public String userListPage() {
		return "pages/admin/userlist";
	}

	// 관리자페이지 - 광고추가
	@GetMapping("/ad-setting")
	public String adSettingPage() {
		return "pages/admin/adSettings";
	}

	// 관리자페이지 - 광고수정
	@GetMapping("/ad-update")
	public String adUpdate() {
		return "pages/admin/adUpdate";
	}

	// 관리자페이지 - 광고전체목록
	@GetMapping("/ad-list")
	public String adListPage() {
		return "pages/admin/adList";
	}

	// 관리자페이지 - 환불요청목록
	@GetMapping("/refund-list")
	public String refundListPage() {
		return "pages/admin/refundList";
	}

	// 관리자페이지 - 환불요청승인
	@GetMapping("/refund-request")
	public String refundRequestPage() {
		return "pages/admin/refundRequest";
	}

	// 결제페이지
	@GetMapping("/payment")
	public String paymentPage() {
		return "pages/payment/paymentTest";
	}

	// 환불페이지
	@GetMapping("/refund")
	public String refundPage() {
		return "pages/payment/refund";
	}



	// 구독상품 - (관리자)포인트 상품 전체조회
	@GetMapping("/subproduct")
	public String subproductPage() {
		return "pages/admin/subproductList";
	}

	// 구독상품 - (관리자)포인트 상품 추가
	@GetMapping("/subproduct-add")
	public String subproductAddPage() {
		return "pages/admin/subproductAdd";
	}

	// 포인트상품 - (관리자)먹거리상품추가
	@GetMapping("/point-product-add")
	public String pointProductAddPage() {
		return "pages/admin/pointProductAdd";
	}

}

// page 패키지에는 페이지를 여는 용도로만 사용
// 실제 데이터를 리턴하는건 api 패키지를 이용

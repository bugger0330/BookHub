<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  </head>
  
  <body>
  <!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">결제하기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	
	
	<div class="container rounded-3 border border-2 border-secondary p-3 mb-3">
      <h3>상품정보</h3>
    </div>
    
    <div class="container rounded-3 border border-2 border-secondary p-3 mb-3">
    <h3>포인트사용</h3>
      <input type="checkbox" id="coupon-box" />
      <label for="coupon-box"> 5,000원 쿠폰 적용 </label>
    </div>
    
    <div class="container rounded-3 border border-2 border-secondary p-3 mb-3">
      <h3>총결제금액</h3>
    </div>
  <div class="container rounded-3 border border-2 border-secondary p-3">
   
    
    <!-- 결제 UI, 이용약관 UI 영역 -->
    <div id="payment-method"></div>
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
    <div class="text-center">
    <button id="payment-button" class="btn btn-primary rounded-3">결제하기</button>
    </div>
    </div>
    
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
    
    <script>
      const coupon = document.getElementById("coupon-box");
      const button = document.getElementById("payment-button");
      
      // 구매자의 고유 아이디를 불러와서 customerKey로 설정하세요.
      // 이메일・전화번호와 같이 유추가 가능한 값은 안전하지 않습니다.
      const widgetClientKey = "test_ck_AQ92ymxN34PvD94BbgEA3ajRKXvd";
      const customerKey = "test_ck_AQ92ymxN34PvD94BbgEA3ajRKXvd";
      const paymentWidget = PaymentWidget(widgetClientKey, customerKey); // 회원 결제
      // const paymentWidget = PaymentWidget(widgetClientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

      const paymentMethodWidget = paymentWidget.renderPaymentMethods(
        "#payment-method",
        { value: 50000 },
        { variantKey: "DEFAULT" }
      );

      paymentWidget.renderAgreement(
        "#agreement", 
        { variantKey: "AGREEMENT" }
      );

      coupon.addEventListener("change", function () {
        if (coupon.checked) {
          paymentMethodWidget.updateAmount(amount - 5000);
        } else {
          paymentMethodWidget.updateAmount(amount);
        }
      });

      button.addEventListener("click", function () {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요. 
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.  
        paymentWidget.requestPayment({
          orderId: "1W_pCfO4rzG9szJEcThKe",
          orderName: "토스 티셔츠 외 2건",
          successUrl: window.location.origin + "/success",
          failUrl: window.location.origin + "/fail",
          customerEmail: "customer123@gmail.com",
          customerName: "김토스",
          customerMobilePhone: "01012341234",
        });
      });
    </script>
  </body>
</html>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- PortOne SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
      var IMP = window.IMP;
      IMP.init("imp60780607");
      
      function generateMerchantUid() {
          // 랜덤한 10자리 숫자 생성
          return Math.floor(Math.random() * 10000000000).toString();
      }


      function requestPay() {
    	  
    	   var merchant_uid = generateMerchantUid(); // 랜덤한 merchant_uid 생성
    	   var productName = ${product.prodName};
           var amount = ${product.price};
        IMP.request_pay(
          {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: merchant_uid,
            name: productName,
            amount: amount,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
        	  // 결제 성공 시 페이지 이동
              if (rsp.success) {
                window.location.href = "/success"; // 성공 페이지 URL로 이동
              } else {
                // 결제 실패 시 처리 로직
                alert("결제에 실패했습니다.");
              }
          }
        );
      }
    </script>
    <style>
    .product-details {
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 20px;
}

.product-name {
  font-size: 24px;
  color: #333;
}

.product-info {
  margin-top: 10px;
}

.price, .period {
  font-size: 18px;
  margin-bottom: 5px;
}

.btn-pay {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.btn-pay:hover {
  background-color: #0056b3;
}
    
    </style>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
  </head>
  <body>
  
     <%@ include file="/WEB-INF/view/layout/header.jsp"%>

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
	 
  <div class="container product-details">
  <h3 class="product-name">${product.prodName}</h3>
  <div class="product-info">
    <div class="price">가격: ${product.price}원</div>
    <div class="period">기간: ${product.period}일권</div>
  </div>
  
</div>
<div class="container text-center">
<button class="btn-pay" onclick="requestPay()">결제하기</button>

</div>


    <!-- 결제하기 버튼 생성 -->
    
   
    
    
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
  </body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- PortOne SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
      var IMP = window.IMP;
      IMP.init("imp60780607");
      
      function generateMerchantUid() {
          // 랜덤한 10자리 숫자 생성
          return Math.floor(Math.random() * 10000000000).toString();
      }


      function requestPay() {
    	  
    	   var merchant_uid = generateMerchantUid(); // 랜덤한 merchant_uid 생성
        IMP.request_pay(
          {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: merchant_uid,
            name: "당근 10kg",
            amount: 1000,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          }
        );
      }
    </script>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
  </head>
  <body>
  
     <%@ include file="/WEB-INF/view/layout/header.jsp"%>

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
    <button onclick="requestPay()">결제하기</button>
    <!-- 결제하기 버튼 생성 -->
    
    
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
  </body>
>>>>>>> a77da8328c350a77426501a3d67927f60f94bf64
</html>
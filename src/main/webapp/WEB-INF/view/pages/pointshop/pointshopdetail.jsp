<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포인트샵</title>
    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>
<body>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10 text-center">
                <h3 class="display-5 text-white animated slideInDown">포인트 구매하기</h3>
            </div>
        </div>
    </div>
</div>
<!-- Header End -->

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card mb-4">
                <div class="card-header">
                    <h3>${list.prodName}</h3>
                </div>
               <div class="card-body">
    <div class="price-section">
        <h3 class="card-title">가격: <span class="price">${list.price} 원</span></h3>
        <div class="text-end">
           <button onclick="requestPay()">결제하기</button>
        </div>
    </div>
</div>


            </div>
        </div>
    </div>
</div>



<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


 <script>
 
 var IMP = window.IMP;
	IMP.init("imp60780607");
 function generateMerchantUid() {
		// 랜덤한 10자리 숫자 생성
		return Math.floor(Math.random() * 10000000000).toString();
	}
	
	



	function requestPay(productId) {
	    var merchant_uid = generateMerchantUid(); // 랜덤한 merchant_uid 생성
	    var productName = "BookHub 포인트 ${list.prodName}";
	    var amount = "${list.price}";
		var point = "${list.point}"
	    var username = "${username}";
		var product = "${list.prodName}";
	    
	    console.log(username);
	    
	    $.ajax({
	        url: "/getid/" + username,
	        type: "GET",
	        success: function(response) {
	            // 요청이 성공하면 받은 회원 정보를 화면에 표시
	            var buyer_name = response.name; // response에서 userName을 가져와서 buyer_name에 대입
	            var buyer_email = response.email;
	            var buyer_phone = response.phone;
	            var buyer_addr1 = response.addr1;
	            var buyer_addr2 = response.addr2;
	            var buyer_zip = response.zip;
	            
	            console.log("buyer_name", buyer_name);
	            console.log("buyer_email", buyer_email);
	            console.log("buyer_phone", buyer_phone);
	            console.log("buyer_addr1", buyer_addr1);
	            console.log("buyer_addr2", buyer_addr2);
	            console.log("buyer_zip", buyer_zip);
	            
	            
	            // 결제 요청 시 productId와 함께 결제 정보에 추가
	            IMP.request_pay({
	                pg: "html5_inicis",
	                pay_method: "card",
	                merchant_uid: username + "_" + merchant_uid,
	                name: productName,
	                amount: amount,
	                buyer_email: buyer_email,
	                buyer_name: buyer_name, 
	                buyer_tel: buyer_phone,
	                buyer_addr: buyer_addr1 + buyer_addr2,
	                buyer_postcode: buyer_zip,
	                m_redirect_url: "/success"
	            }, function (rsp) {
    if (rsp.success) {
    	var userData = {
    			  "userId": username,
    			  "pointName": product,
    			  "purchaseDate": new Date().toISOString(),
    			  "point": point,
    			  "impUid": rsp.imp_uid,
    			  "merchantUid": rsp.merchant_uid 
    			};
      jQuery.ajax({
        url: "/user-point/save", 
        method: "POST",
        headers: { "Content-Type": "application/json" },
        data: JSON.stringify(userData),
      }).done(function (data) {
        // 가맹점 서버 결제 API 성공시 로직
		window.location.href = "/success" 
      })
    } else {
      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
    }
  });
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패하면 에러 메시지 출력
	            alert("오류: " + xhr.responseText);
	        }
	    });
	}
    </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
    <title>BookHub :: 독서와 무제한으로 친해지기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">
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

	function requestPay(productId) {
        var merchant_uid = generateMerchantUid(); // 랜덤한 merchant_uid 생성
        var productName = "BookHub 구독상품 ${product.prodName}";
        var amount = "${product.price}";

        // 결제 요청 시 productId도 함께 전달
        IMP.request_pay({
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
            // productId도 결제 정보에 추가
            custom_data: {
                productId: productId
            }
        }, function(rsp) {
            // 결제 성공 시 페이지 이동
            if (rsp.success) {
                window.location.href = "/payment/success/" + rsp.custom_data.productId; // 성공 페이지 URL로 이동
            } else {
                // 결제 실패 시 처리 로직
                alert(`결제에 실패했습니다.`);
                window.location.href = "/sc-product/nopage"
            }
        });
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
	<div class="container-fluid bg-dark py-5 mb-5 ">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">결제하기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

<div class="container">
    <div class="card product-card rounded-3">
        <div class="card-header">
            <h3 class="card-title">구매상품내역</h2>
        </div>
        <div class="card-body">
            <h3 class="product-name">${product.prodName}</h3>
            <div class="product-info">
    <div class="price"><strong>가격:</strong> ${product.formatBalance()}</div>
    <div class="period"><strong>기간:</strong> ${product.period}일</div>
</div>

        </div>
        
    </div>
    <div class=" text-center mt-5">
            <button class="btn btn-primary btn-lg" onclick="requestPay(${product.spId})">결제하기</button>

        </div>
</div>





	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>

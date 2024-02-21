<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 요금제</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.card {
	border: none;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.card:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.card-img {
	width: 100%;
	height: auto;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/view/layout/header.jsp"%>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">구독상품
						구매하기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="text-center wow fadeInUp mb-5" data-wow-delay="0.1s">
		<h6 class="section-title bg-white text-center text-primary px-3">Subscribe</h6>
		<h1 class="mb-3">BookHub 구독요금제</h1>
		<h5>BookHub 구독상품을 구매하시고, 구독자 전용 혜택을 누리세요!</h5>

		<h6
			class="section-title bg-white text-center text-primary px-3 mt-5 mb-3">구독자
			전용혜택</h6>
		<p class="mb-0">
			<i class="fa fa-arrow-right text-primary me-2"></i>해당 기간권 구매시 무제한 포인트
			사용가능
		</p>
		<p class="mb-0">
			<i class="fa fa-arrow-right text-primary me-2"></i>카페 베이커리/음료 구매 및 기타
			상품 포인트로 결제가능
		</p>
	</div>

	<div class="container wow fadeInUp">
		<div class="row justify-content-center">
			<c:forEach var="product" items="${productList}">
				<div class="col-lg-4">
					<div class="card mb-4">
						<div class="card-body">
							<h5 class="card-title">${product.prodName}</h5>
							    <p class="card-text">${product.formatBalance()}</p>
							<a href="#" class="btn btn-primary">선택</a>
						</div>

					</div>
				</div>
			</c:forEach>

		</div>
	</div>


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>
</html>

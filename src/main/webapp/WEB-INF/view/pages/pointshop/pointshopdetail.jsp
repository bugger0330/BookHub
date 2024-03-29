<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트샵</title>
<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.custom-container {
	max-width: 200%; /* 최대 넓이 설정 */
	margin-right: auto; /* 오른쪽 여백 자동 조정 */
	margin-left: auto; /* 왼쪽 여백 자동 조정 */
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
					<h3 class="display-5 text-white animated slideInDown">포인트 구매하기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="custom-container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<h3>${list.prodName}</h3>
					</div>
					<div class="card-body">
						<div class="price-section">
							<h3 class="card-title">
								가격: <span class="price">${list.price} 원</span>
							</h3>
							<div class="text-end">
								<button class="btn btn-primary" onclick="requestPay()">결제하기</button>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


	<div class="custom-container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<h3>⚠ 구매시 유의사항 ⚠</h3>
					</div>
					<div class="card-body">
						<div class="alert alert-info" role="alert">
							<h5 class="alert-heading">포인트 구매 시 유의사항</h5>
							<ul>
								<li>포인트 구매 시 계정으로 포인트가 충전됩니다.</li>
								<li>포인트는 사용 후 환불이 불가능합니다.</li>
								<li>부분 환불은 지원되지 않으며, 충전 후 포인트를 사용하지 않아야 환불이 가능합니다.</li>
							</ul>
							<p>
								더 자세한 내용은 <a id="termsBtn" href="#">이용약관</a>을 확인해주세요.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="termsModal" tabindex="-1"
		aria-labelledby="termsModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="termsModalLabel">이용약관</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="terms-content">
						<h4>제1조(목적)</h4>
						<p>본 약관은 "포인트 구매 서비스"를 제공하는 회사와 회원 간의 권리와 의무 및 책임사항을 규정함을 목적으로
							합니다.</p>

						<h4>제2조(정의)</h4>
						<p>
							"포인트 구매 서비스"란 회원이 회사의 웹사이트 또는 애플리케이션을 통해 포인트를 구매하는 서비스를 말합니다.<br>
							"회원"이란 본 약관에 동의하고 회사와 이용계약을 체결한 자를 말합니다.
						</p>

						<h4>제3조(포인트 구매)</h4>
						<p>
							회원은 회사가 제공하는 결제 수단을 통해 포인트를 구매할 수 있습니다.<br> 포인트 구매 시, 회사는
							회원이 지정한 결제 수단으로부터 대금을 수령하며, 이에 따라 회원의 계정에 포인트를 충전합니다.
						</p>

						<h4>제4조(환불)</h4>
						<p>
							회원이 구매한 포인트는 사용 후에는 환불이 불가능합니다.<br> 회원이 구매한 포인트 중 일부를 사용한
							경우, 해당 포인트에 대한 환불도 불가능합니다.
						</p>

						<h4>제5조(약관의 변경)</h4>
						<p>회사는 필요한 경우 본 약관을 변경할 수 있으며, 변경 사항은 웹사이트나 애플리케이션을 통해 공지합니다.</p>

						<h4>제6조(기타)</h4>
						<p>본 약관에 명시되지 않은 사항은 관련 법령 및 회사의 개별 정책에 따릅니다.</p>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>








	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
<script>
    let prodName = `${list.prodName}`;
    let price = `${list.price}`;
    let point = `${list.point}`;
    let username = `${username}`;
    
    console.log("포인트", point);
</script>
<script src="/js/pointshop/payment.js"></script>
	

</body>
</html>

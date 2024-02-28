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
				url : "/getid/" + username,
				type : "GET",
				success : function(response) {
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
						pg : "html5_inicis",
						pay_method : "card",
						merchant_uid : username + "_" + merchant_uid,
						name : productName,
						amount : amount,
						buyer_email : buyer_email,
						buyer_name : buyer_name,
						buyer_tel : buyer_phone,
						buyer_addr : buyer_addr1 + buyer_addr2,
						buyer_postcode : buyer_zip,
						m_redirect_url : "/success"
					}, function(rsp) {
						if (rsp.success) {
							var userData = {
								"userId" : username,
								"pointName" : product,
								"purchaseDate" : new Date().toISOString(),
								"point" : point,
								"impUid" : rsp.imp_uid,
								"merchantUid" : rsp.merchant_uid
							};
							jQuery.ajax({
								url : "/user-point/save",
								method : "POST",
								headers : {
									"Content-Type" : "application/json"
								},
								data : JSON.stringify(userData),
							}).done(function(data) {
								// 가맹점 서버 결제 API 성공시 로직
								window.location.href = "/success"
							})
						} else {
							alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
						}
					});
				},
				error : function(xhr, status, error) {
					// 요청이 실패하면 에러 메시지 출력
					alert("오류: " + xhr.responseText);
				}
			});
		}
	</script>

	<script>
		// 버튼 클릭 시 모달 창 표시
		$(document).ready(function() {
			$("#termsBtn").click(function() {
				$("#termsModal").modal('show');
			});
		});
	</script>


</body>
</html>

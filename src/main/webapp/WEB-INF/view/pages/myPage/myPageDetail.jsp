<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/img/favicon.ico" rel="icon">
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

.card-header {
	background-color: #007bff; /* 파란색 배경색 */
	color: white; /* 흰색 텍스트 */
	padding: 15px; /* 안쪽 여백 */
	border-radius: 10px 10px 0 0; /* 둥근 테두리 설정 */
}

.rounded-box {
	border: 1px solid #ced4da;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 10px;
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
					<h3 class="display-5 text-white animated slideInDown">나의 정보</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- 메인 컨텐츠 시작 -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="container-xxl py-5">
				<div class="container">
					<div class="row g-5">
						<div class="col-lg-1 wow fadeInUp" data-wow-delay="0.1s"
							style="min-height: 400px;"></div>
						<div class="col-lg-10" data-wow-delay="0.3s">
							<h6 class="section-title bg-white text-start text-primary pe-3">About
								Me</h6>
							<h1 class="mb-4">안녕하세요! ${user.username} 님</h1>
							<input type="hidden" id="username" value="${user.username}">
							<input type="hidden" id="userid" value="${user.id}">
							<div class="row">
								<div class="col-sm-5">
									<div class="card mb-3">
										<div class="card-header text-white">
											<!-- 카드 헤더 -->
											<h5 class="card-title">나의 정보</h5>
										</div>
										<div class="card-body">
											<div class="row mb-3">
												<div class="col-sm-4">
													<p class="font-weight-bold mb-0">회원 아이디:</p>
												</div>
												<div class="col-sm-8">
													<p id="userName"></p>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-4">
													<p class="font-weight-bold mb-0">이름:</p>
												</div>
												<div class="col-sm-8">
													<p id="name"></p>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-4">
													<p class="font-weight-bold mb-0">연락처:</p>
												</div>
												<div class="col-sm-8">
													<p id="phone"></p>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-4">
													<p class="font-weight-bold mb-0">보유포인트:</p>
												</div>
												<div class="col-sm-8">
													<p id="point"></p>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-4">
													<p class="font-weight-bold mb-0">가입일:</p>
												</div>
												<div class="col-sm-8">
													<p id="rdate"></p>
												</div>
											</div>
											<button>
											<a href="/myPage/update/${user.id}">수정/탈퇴</a>
											</button>
										</div>
									</div>
								</div>
								<div class="col-sm-7">
									<div class="card mb-3">
										<div class="card-header text-white">
											<!-- 카드 헤더 -->
											<h5 class="card-title">나의 구매내역</h5>
										</div>
										<div class="card-body">
											<table class="table text-center">
												<thead>
													<tr>
														<th>순번</th>
														<th>구매일자</th>
														<th>구매상품명</th>
														<th>환불요청<br/>여부
														</th>
														<th>환불요청</th>
													</tr>
												</thead>
												<tbody>
													<!-- 데이터가 없을 때 표시될 행 -->
													<tr id="noDataMessage" style="display: none;">
														<td colspan="5">내역이 없습니다.</td>
													</tr>
													<!-- 실제 데이터 행 -->
													<tr id="dataRow" style="display: none;">
														<td id="id"></td>
														<td id="purchaseDate"></td>
														<td id="pointName"></td>
														<td id="refundYn"></td>
														<td><button id="refundButton" class="btn btn-primary">환불요청</button></td>
													</tr>
												</tbody>

											</table>
										</div>


									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 메인 컨텐츠 끝 -->


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/user/mypage.js"></script>
	


</body>
</html>
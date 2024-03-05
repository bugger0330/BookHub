<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card-header {
	background-color: #343a40;
	color: white;
}

.custom-form-group {
	margin-bottom: 20px;
}

.custom-label {
	display: block;
	margin-bottom: 5px;
}

.form-control {
	width: calc(100% - 20px); /* 폼 요소 너비 조정 */
	margin-bottom: 10px;
}

.btn-submit {
	width: calc(50% - 5px); /* 버튼 너비 조정 */
	border-radius: 20px; /* 테두리를 둥글게 조정 */
}

.container {
	margin-top: 50px;
}

/* 추가된 부분: 버튼 간격 조정 */
.custom-form-group .btn-submit {
	margin-right: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/view/layout/header.jsp"%>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">회원정보
						수정/탈퇴</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<form action="/myPage/edit/${user.id}" id="edit-btn" method="post">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="id" value="${user.id}" />

							<div class="custom-form-group">
								<label class="custom-label" for="userName">아이디</label> <input
									type="text" class="form-control" id="userName" name="userName"
									value="${user.userName}" required readonly>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="name">이름</label> <input
									type="text" class="form-control" id="name" name="name"
									value="${user.name}" required>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="password">비밀번호</label> <input
									type="password" class="form-control" id="password"
									name="password" value="${user.password}" required>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="email">이메일</label> <input
									type="email" class="form-control" id="email" name="email"
									value="${user.email}" required>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="phone">연락처</label> <input
									type="text" class="form-control" id="phone" name="phone"
									value="${user.phone}" placeholder="ex) 010-1234-5678" required>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="zip">우편번호</label> <input
									type="text" class="form-control" id="zip" name="zip"
									value="${user.zip}" required>
								<button type="button" class="find-zip" id="find-address-btn">조회</button>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="addr1">주소</label> <input
									type="text" class="form-control" id="addr1" name="addr1"
									value="${user.addr1}" required>
							</div>

							<div class="custom-form-group">
								<label class="custom-label" for="addr2">상세 주소</label> <input
									type="text" class="form-control" id="addr2" name="addr2"
									value="${user.addr2}" required>
							</div>

							<div class="custom-form-group d-flex justify-content-center">
								<button type="submit" class="btn btn-primary btn-submit">수정하기</button>
							</div>
						</form>
						
						<div class="custom-form-group d-flex justify-content-center">
							<form action="/myPage/delete/${user.id}" method="post"
								id="delete-form">
								<input type="hidden" name="_method" value="put" />
								<button type="submit" id="delete-btn"
									class="btn btn-danger btn-submit">회원탈퇴</button>
							</form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#edit-btn')
									.on(
											'submit',
											function(event) {
												var isValid = true;

												// 이름 유효성 검사
												var name = $('#name').val();
												if (!name
														.match(/^[A-Za-z가-힣]+$/)) {
													$('#name-error')
															.text(
																	'이름은 영어 또는 한글만 입력 가능합니다.');
													$('#name').addClass(
															'is-invalid');
													isValid = false;
												} else {
													$('#name-error').text('');
													$('#name').removeClass(
															'is-invalid');
												}

												// 이메일 유효성 검사
												var email = $('#email').val();
												if (!validateEmail(email)) {
													$('#email-error')
															.text(
																	'유효한 이메일 형식이 아닙니다.');
													$('#email').addClass(
															'is-invalid');
													isValid = false;
												} else {
													$('#email-error').text('');
													$('#email').removeClass(
															'is-invalid');
												}

												// 전화번호 유효성 검사
												var phone = $('#phone').val();
												if (!phone
														.match(/^\d{3}-\d{3,4}-\d{4}$/)) {
													$('#phone-error')
															.text(
																	'유효한 전화번호 형식을 입력하세요. (예: 010-1234-5678)');
													$('#phone').addClass(
															'is-invalid');
													isValid = false;
												} else {
													$('#phone-error').text('');
													$('#phone').removeClass(
															'is-invalid');
												}

												// 유효성 검사 결과에 따라 폼 제출 여부 결정
												if (!isValid) {
													event.preventDefault(); // 폼 제출 방지
												}
											});

						});

		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}

		// 주소찾기 버튼 클릭 이벤트 핸들러
		$('#find-address-btn').on('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 주소 검색 결과가 선택되었을 때 실행되는 부분
					// 검색 결과를 사용자가 선택한 값을 입력 폼에 채워넣는 등의 동작을 여기에 추가할 수 있습니다.
					$('#zip').val(data.zonecode); // 우편번호 입력 폼에 우편번호 값 채우기
					$('#addr1').val(data.address); // 주소 입력 폼에 주소 값 채우기
					$('#addr2').focus(); // 상세 주소 입력란으로 포커스 이동
				}
			}).open();
		});
	</script>


</body>
</html>



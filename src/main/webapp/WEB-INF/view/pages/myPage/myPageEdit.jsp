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

.btn-submit {
	width: 100%;
}

.form-group label {
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">회원정보 수정,
						탈퇴</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->


	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<!-- <div class="card-header bg-dark text-white">회원 정보 수정</div> -->
					<div class="card-body">
						<form action="/myPage/edit/${user.id}" id="edit-btn" method="post">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="id" value="${user.id}" />

							<div class="form-group">
								<label for="userName">아이디</label> <input type="text"
									class="form-control" id="userName" name="userName"
									value="${user.userName}" required readonly>
								<div id="userNameFeedback" class="invalid-feedback"></div>
							</div>

							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name" value="${user.name}"
									required>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password"
									value="${user.password}" required>
							</div>

							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="email"
									value="${user.email}" required>
							</div>
							<div class="form-group">
								<label for="phone">연락처</label> <input type="text"
									class="form-control" id="phone" name="phone"
									value="${user.phone}" required>
								<div id="phoneFeedback" class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label for="zip">우편번호</label> <input type="text"
									class="form-control" id="zip" name="zip" value="${user.zip}"
									required>
								<div id="zipFeedback" class="invalid-feedback"></div>
							</div>

							<div class="form-group">
								<label for="addr1">주소</label> <input type="text"
									class="form-control" id="addr1" name="addr1"
									value="${user.addr1}" required>
							</div>
							<div class="form-group">
								<label for="addr2">상세 주소</label> <input type="text"
									class="form-control" id="addr2" name="addr2"
									value="${user.addr2}" required>
							</div>


							<button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


						<form id="delete-btn" action="/myPage/delete/${user.id}"
							method="post">
							<input type="hidden" name="_method" value="put" />
							<button type="submit" class="btn btn-danger btn-submit">탈퇴하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
<script>
	/* 확인 창 */
	$(document).ready(function() {
		$("#edit-btn").submit(function(e) {
			if (!confirm("수정 하시겠습니까?")) {
				e.preventDefault(); // 폼 제출을 중단합니다.
			}
		});
	});

	$(document).ready(function() {
		$("#delete-btn").submit(function(e) {
			if (!confirm("탈퇴 하시겠습니까?")) {
				e.preventDefault(); // 폼 제출을 중단합니다.
			}
		});
	});
</script>


</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
.log-container {
	width: 500px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.log-form-group {
	margin-bottom: 20px;
}

.log-form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.log-form-group input, .log-form-group button {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.log-form-group button {
	margin-top: 10px;
	background: #06BBCC;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.log-form-group button:hover {
	background-color: #0056b3;
}

.buttons {
	display: flex;
	justify-content: space-between;
}

.delete-btn {
	background-color: red;
}
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">마이페이지</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

<!-- 	<div class="blog__sidebar__item">
		<h4>마이페이지</h4>
		<ul>
			<li><a href="#">개인 정보</a></li>
			<li><a href="#">관심 목록</a></li>
			<li><a href="#">결제 및 구독</a></li>
		</ul>
	</div> -->


	<div class="log-container">
		<h2>내 정보</h2>
		<form action="#" method="post">
			<div class="log-form-group">
				<label for="userName">아이디</label> <input type="text" id="userName"
					name="userName" required>
			</div>
			<div class="log-form-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="log-form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div class="log-form-group">
				<label for="phone">휴대폰 번호</label> <input type="text" id="phone"
					name="phone" required>
			</div>
			<div class="log-form-group">
				<label for="email">이메일</label> <input type="text" id="email"
					name="email" required>
			</div>
			<div class="log-form-group">
				<label for="zip">우편 번호</label> <input type="text" id="zip"
					name="zip" required>
			</div>
			<div class="log-form-group">
				<label for="addr1">기본 주소</label> <input type="text" id="addr1"
					name="addr1" required>
			</div>
			<div class="log-form-group">
				<label for="addr2">상세 주소</label> <input type="text" id="addr2"
					name="addr2" required>
			</div>
			<button type="submit" class="btn btn-success">수정 하기</button>
			<button type="submit" class="btn btn-danger">탈퇴 하기</button>
			<hr />
		</form>
	</div>

</body>
</html>



<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


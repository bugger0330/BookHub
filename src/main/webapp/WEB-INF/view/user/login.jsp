<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
.log-container {
	width: 500px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center; /* 수정된 부분 */
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
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">안녕하세요,
						BookHub 입니다.</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="log-container">
		<h2>로그인</h2>
		<form action="login_process.jsp" method="post">
			<div class="log-form-group">
				<label for="email">아이디(이메일)</label> <input type="email" id="email"
					name="email" placeholder="Enter email" required>
			</div>
			<div class="log-form-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" placeholder="Enter password" required>
			</div>
			<div class="log-form-group">
				<button type="submit" class="login-btn">로그인</button>
				<hr />
				<h5>
					회원이 아니신가요? <a href="회원가입 페이지 URL" class="signup-btn">회원가입</a>
				</h5>
				<hr />
				<h5>소셜로그인</h5>
			</div>
		</form>
	</div>


</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


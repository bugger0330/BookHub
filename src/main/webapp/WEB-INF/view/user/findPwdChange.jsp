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
<style>
.log-container {
	width: 700px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

/* 추가사항 */
.change-pass {
	padding: 20px;
	box-sizing: border-box;
}
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">비밀번호 찾기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="log-container">
		<form action="#">
			<div class="change-pass">
				<div class="log-form-group">
					<label for="password1">새 비밀번호</label> <input type="password" id="password1"
						name="password1" placeholder="Enter password" class="input-password" required>
				</div>
				<div class="log-form-group">
					<label for="password2">새 비밀번호 확인</label> <input type="password" id="password2"
						name="password2" placeholder="Enter password" class="input-password" required>
				</div>
				<div class="log-form-group">
					<button type="button" class="btn-change-pass">완료</button>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		const btn = document.getElementsByClassName('btn-change-pass')[0];
		btn.addEventListener('click', (e) => {
			alert('비밀번호 완료');
			window.location.href="/";
		});
	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


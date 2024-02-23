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

/* 추가사항 */
.result-id {
	width: 80%;
	height: 150px;
	border-radius: 25px;
	margin: 15px auto;
	background-color: #f1f1f1;
	justify-content: center;
}
.result-id span {
	line-height: 150px;
}
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">아이디 찾기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="log-container">
		<h3>찾기 결과</h3>
		<span>현재 조회된 아이디입니다.</span>
		
		<div class="result-id">
			<span>**님의 아이디 : bookstory0214</span>
		</div>
		
		<a href="/">메인으로</a>
	</div>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


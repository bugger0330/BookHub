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
				<h6>
					회원이 아니신가요? <a href="회원가입 페이지 URL" class="signup-btn">회원가입</a>
				</h6>
				<h6>
					계정정보를 잊으셨나요? <a href="회원정보찾기 페이지 URL" class="signup-btn">계정찾기</a>
				</h6>
				<hr />
				<h5>소셜로그인</h5>
				<div class="text-center">
		
		<a
			href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2c617de944e126184f4c77cab2d22c93&redirect_uri=http://localhost/user/kakao-callback">
			<img alt="" src="/img/kakao_login_medium_narrow.png"
			height="38">
		</a>
	
		<%
		String clientId = "hVlPdCIutDDpu0e0tAA1";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost/user/naver-callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>
		<a href="<%=apiURL%>"><img height="38" width="154.53"
			src="/img/btnG_완성형.png" /></a>
			
			<a
			href="">
			<img alt="" src="/img/web_light_sq_ctn@4x.png"
			height="38" class="mt-3">
		</a>
			</div>
			</div>
		</form>
	</div>


</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


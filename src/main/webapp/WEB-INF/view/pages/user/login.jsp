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

.remember-me-group {
	display: flex;
    justify-content: flex-end;
    align-items: center;
    margin: 0 10px 10px 0;
}
.remember-me-group > label {
	font-weight: bold;
	margin-left: 5px;
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
		<form action="/login" method="post">
			<div class="log-form-group">
				<label for="uid">아이디</label> <input type="text" id="username"
					name="username" placeholder="Enter username" required>
			</div>
			<div class="log-form-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" placeholder="Enter password" required>
			</div>
			<div class="remember-me-group">
				<input type="checkbox" id="remember" name="remember">
				<label for="remember">자동로그인</label> 
			</div>
			<div class="log-form-group">
				<button type="submit" class="login-btn">로그인</button>
				<hr />
				<h6>
					회원이 아니신가요? <a href="/user/join" class="signup-btn">회원가입</a>
				</h6>
				<h6>
					아이디를 잊으셨나요? <a href="/user/findId" class="signup-btn">아이디 찾기</a>
				</h6>
				<h6>
					비밀번호를 잊으셨나요? <a href="/user/findPwd" class="signup-btn">비밀번호 찾기</a>
				</h6>
				<hr />
				<h5>소셜로그인</h5>
				<div class="text-center">
		
		<%
		String kakoClientId = "3f33875eb91fe402a3b0db6bf310661a";//애플리케이션 클라이언트 아이디값";
		String kakaoRedirectURI = URLEncoder.encode("http://localhost/kakao-callback", "UTF-8");
		String kakaoApiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
			kakaoApiURL += "&client_id=" + kakoClientId;
			kakaoApiURL += "&redirect_uri=" + kakaoRedirectURI;
		%>
		<a
			href="/oauth2/authorization/kakao">
			<img alt="kakao" src="/img/kakao_login_medium_narrow.png"
			height="38">
		</a>
		
		<%
		String naverClientId = "hVlPdCIutDDpu0e0tAA1";//애플리케이션 클라이언트 아이디값";
		String naverRedirectURI = URLEncoder.encode("http://localhost/user/naver-callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String naverApiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		naverApiURL += "&client_id=" + naverClientId;
		naverApiURL += "&redirect_uri=" + naverRedirectURI;
		naverApiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>
		<a href="<%=naverApiURL%>"><img height="38" width="154.53"
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
	
	<script>
		// url 파라미터
	    const urlParams = new URLSearchParams(window.location.search);
	    const successValue = urlParams.get('success');
	
	    if (successValue === '401') {
	        alert('아이디 혹은 비밀번호를 다시 확인해주세요.');
	    }
	    if (successValue === '403') {
	        alert('소셜 로그인 인증이 실패하였습니다. 고객센터로 문의해주세요.');
	    }
	    if (successValue === '200') {
	        alert('정상적으로 로그아웃되었습니다.');
	    }
	    
	    // 파라미터 삭제
	    history.replaceState({}, null, location.pathname);
	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


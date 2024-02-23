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
.register-container { /* style 변경 */
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

/* 회원가입 추가사항 */

.adult-list {
	width: 100%;
	height: auto;
	list-style: none;
	box-sizing: border-box;
	padding: 0;
}

.adult-list .radio-item {
	display: inline-block;
	width: 25%;
}

.blind {
	position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}

.adult-list label {
	display: block;
    position: relative;
    box-sizing: border-box;
    width: 100%;
    padding: 6px 0;
    border-radius: inherit;
    border: 1px solid #c6c6c6;
    font-weight : normal;
    font-size: 13px;
    line-height: 18px;
    color: #929294;
    text-align: center;
}
.adult-list input:checked+label {
	z-index: 1;
    border-color: #06BBCC;
    font-weight: 500;
    color: #06BBCC;
}

.password-input {

}
.address {
	margin-top: 50px;
	box-sizing: border-box;
}

.input-email, .input-id {
	width: 76% !important;
}

.check-id, .find-zip, .auth-email {
	width: 20% !important;
	padding: 11px !important;
}

#zip {
	width: 30%;
}
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">정보 입력</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="register-container">
		
		<h3>회원가입</h3>
		<form action="#">
			<div class="log-form-group">
				<label for="uid">아이디</label> <input type="text" id="uid"
					name="uid" placeholder="Enter uid" class="input-id" required>
				<button type="button" class="check-id">중복체크</button>
			</div>
			<div class="log-form-group">
				<label for="password">비밀번호</label> <input type="password" id="password"
					name="password" placeholder="Enter password" required>
			</div>
			<div class="log-form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" placeholder="Enter name" required>
			</div>
			<div class="log-form-group">
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" placeholder="Enter email" class="input-email" required>
				<button type="button" class="auth-email">인증하기</button>
			</div>
			<div class="log-form-group">
				<label for="hp">휴대폰 번호</label> <input type="text" id="hp"
					name="hp" placeholder="Enter hp" required>
			</div>
			<div class="log-form-group">
				<label>성별</label>
				<ul class="adult-list">
					<li class="radio-item">
						<input type="radio" id="gender1" class="blind" name="gender" value="M" required>
						<label for="gender1">남자</label>
					</li>
					<li class="radio-item">
						<input type="radio" id="gender2" class="blind" name="gender" value="W" required>
						<label for="gender2">여자</label>
					</li>
				</ul>
			</div>
			<div class="address">
				<div class="log-form-group">
					<label for="zip">우편번호</label> <input type="text" id="zip"
						name="zip" placeholder="우편주소" readonly required>
					<button type="button" class="find-zip">조회</button>
				</div>
				<div class="log-form-group">
					<label for="addr1">기본 주소</label> <input type="text" id="addr1"
						name="addr1" placeholder="기본 주소" readonly required>
				</div>
				<div class="log-form-group">
					<label for="addr2">상세 주소</label> <input type="text" id="addr2"
						name="addr2" placeholder="상세 주소" required>
				</div>
			</div>
			<div class="log-form-group">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</div>


</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


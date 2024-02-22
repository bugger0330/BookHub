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
.register-container > h3 {
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

.log-form-group p {
	margin-top: 10px;
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

.blind-hide {
	position: fixed;
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

.address {
	margin-top: 50px;
	box-sizing: border-box;
}

.input-email, .input-id, .input-authNumber {
	width: 76% !important;
}

.check-id, .find-zip, .btn-email, .btn-complete {
	width: 20% !important;
	padding: 11px !important;
}

#zip {
	width: 30%;
}

.result-uid, .result-pass, .result-name, .result-hp, .result-gender {
	display: none;
}

.essential {
	color: red;
	font-weight: bold;
}

#explanation {
	color: #52565b;
	font-size: 12px;
	margin-bottom: 20px;
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
		<p id="explanation">* 이 표기되어 있는 칸은 필수 입력란입니다.</p>
		<form action="/user/signUp" method="post">
			<div class="log-form-group div-uid-input">
				<label for="uid"><span class="essential">*</span> 아이디</label> <input type="text" id="uid"
					name="uid" placeholder="Enter uid" class="input-id" maxlength="12" required>
				<button type="button" class="check-id">중복체크</button>
				<p class="result-uid"></p>
			</div>
			<div class="log-form-group">
				<label for="password"><span class="essential">*</span> 비밀번호</label> <input type="password" id="password"
					name="password" placeholder="Enter password" onblur="valiPass()" maxlength="12" required>
				<p class="result-pass"></p>
			</div>
			<div class="log-form-group">
				<label for="name"><span class="essential">*</span> 이름</label> <input type="text" id="name"
					name="name" onblur="valiName()" placeholder="Enter name" required>
				<p class="result-name"></p>
			</div>
			<div class="log-form-group">
				<label for="email"><span class="essential">*</span> 이메일</label> <input type="email" id="email"
					name="email" placeholder="Enter email" class="input-email" required>
				<button type="button" class="btn-email" onclick="valiEmail()">인증하기</button>
				<p class="result-email"></p>
				
			</div>
			<div class="log-form-group">
				<label for="hp"><span class="essential">*</span> 휴대폰 번호</label> <input type="text" id="hp"
					name="hp" placeholder="Enter hp" onblur="valiHp()" required>
				<p class="result-hp"></p>
			</div>
			<div class="log-form-group">
				<label><span class="essential">*</span> 성별</label>
				<ul class="adult-list">
					<li class="radio-item">
						<input type="radio" id="gender1" class="blind" name="gender" onchange="checkGender()" value="1" required>
						<label for="gender1">남자</label>
					</li>
					<li class="radio-item">
						<input type="radio" id="gender2" class="blind" name="gender" onchange="checkGender()" value="2" required>
						<label for="gender2">여자</label>
					</li>
				</ul>
				<p class="result-gender"></p>
			</div>
			<div class="address">
				<div class="log-form-group">
					<label for="zip">우편번호</label> <input type="text" id="zip"
						name="zip" placeholder="우편주소" readonly>
					<button type="button" class="find-zip">조회</button>
				</div>
				<div class="log-form-group">
					<label for="addr1">기본 주소</label> <input type="text" id="addr1"
						name="addr1" placeholder="기본 주소" readonly>
				</div>
				<div class="log-form-group">
					<label for="addr2">상세 주소</label> <input type="text" id="addr2"
						name="addr2" placeholder="상세 주소">
				</div>
			</div>
			<div class="log-form-group">
				<button type="submit" class="btn-form">회원가입</button>
			</div>
		</form>
	</div>
	
	<script src="/js/signUp.js"></script>
</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
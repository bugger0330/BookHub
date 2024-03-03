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
.chooes-find {
	list-style: none;
	margin: 0;
	padding: 0;
	border-bottom: 1px solid black;
}

.email-auth-form, .change-find {
	width: 80%;
	margin: 0 auto;
	padding: 20px 0;
}
.email-auth-form .input-email {
	width: 76% !important;
}
.email-auth-form .auth-email {
	width: 20% !important;
	padding: 11px !important;
}
.email-auth-form .btn-complete {
	margin-top: 20px;
}

.change-find {
	padding: 10px;
	border-top: 1px solid #ccc;
	text-align: right;
	box-sizing: border-box;
}
.change-find > span {
	font-size: 10px;
	text-align: center;
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
		<div class="email-auth-form">
			<!-- 이메일 인증 -->
			<form action="#">
				<div class="log-form-group">
					<label for="email">이메일 인증</label> <input type="email" id="email"
						name="email" placeholder="Enter email" class="input-email" required>
					<button type="button" class="auth-email" onclick="authEmail()">인증하기</button>
				</div>
			</form>
			<!-- 인증 확인 -->
			<form action="#">
				<div class="log-form-group">
					<label for="authNumber">인증번호</label> <input type="text" id="auth-number"
						name="authNumber" placeholder="Enter number" class="input-authNumber" required>
						<button type="button" class="btn-complete" onclick="EnterNumber()">완료</button>
				</div>
			</form>
		</div>
		<div class="change-find">
			<a href="/findPwd">-> 비밀번호 변경하기</a> <br>
			<span>비밀번호를 잊어버리셨나요?</span>
		</div>
	</div>

	<script>
		const inputEmail = document.getElementById('email');
		const authNumber = document.getElementById('auth-number');

		const btnAuthEmail = document.getElementsByClassName('input-email')[0];
		const btnNum = document.getElementsByClassName('btn-complete')[0];

		// 이메일 인증
		function authEmail() {

			const email = inputEmail.value;
			
			fetch(`/sendEmail/`+email,{
				method: "POST",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
			}).then((response) => response.text())
			.then((data) => {
				alert('이메일이 전송되었습니다.');
			})
			.catch((error) => {
				alert('이메일 인증을 실패했습니다.');
				console.log(error);
			});
			
		}

		function EnterNumber() {
			const num = authNumber.value;
			alert('num : '+num);

			fetch(`/authNumber?number=`+num,{
				method: "GET",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
			}).then((response) => response.text())
			.then((data) => {
				if(data <= 1){
					
				}
			})
			.catch((error) => {
				alert('인증 번호에 문제가 발생했습니다.');
				console.log(error);
			});
		}

	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


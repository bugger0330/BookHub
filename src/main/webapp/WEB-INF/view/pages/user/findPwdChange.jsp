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
.result-pass {
	margin-top: 10px;
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
						name="password1" placeholder="Enter password" class="input-password" onblur="valiPass1()" required>
						<p class="result-pass"></p>
				</div>
				<div class="log-form-group">
					<label for="password2">새 비밀번호 확인</label> <input type="password" id="password2"
						name="password2" placeholder="Enter password" class="input-password" onblur="valiPass2()" required>
						<p class="result-pass"></p>
				</div>
				<div class="log-form-group">
					<button type="button" class="btn-change-pass">완료</button>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		const btn = document.getElementsByClassName('btn-change-pass')[0];
		const inputPass1 = document.getElementById('password1');
		const inputPass2 = document.getElementById('password2');
		const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,12}$/;
		const resultPass1 = document.getElementsByClassName('result-pass')[0];
		const resultPass2 = document.getElementsByClassName('result-pass')[1];
		let isPassOk1	= false;
		let isPassOk2	= false;
		const VALIDATION_PASS	= '숫자, 영문, 특수문자 등을 조합하여 8~12자리까지 설정해 주세요.';
		
		// 비밀번호
		function valiPass1() {
			const password = inputPass1.value;
			
			if(!password.match(rePass)) {
				inputPass1.style.borderColor = 'red';
				resultPass1.style.color = 'red';
				resultPass1.textContent = VALIDATION_PASS;
				isPassOk1 = false;
			} else {
				inputPass1.style.borderColor = '#ccc';
				resultPass1.textContent = '';
				isPassOk1 = true;
			}
		}
		// 비밀번호 확인
		function valiPass2() {
			const password1 = inputPass1.value;
			const password2 = inputPass2.value;
			
			if(!password2.match(rePass)) {
				inputPass2.style.borderColor = 'red';
				resultPass2.style.color = 'red';
				resultPass2.textContent = VALIDATION_PASS;
				isPassOk2 = false;
			} else {
				inputPass2.style.borderColor = '#ccc';
				resultPass2.textContent = '';
	
				// 비밀번호 일치 확인
		        if (password1 !== password2) {
		        	inputPass1.style.borderColor = 'red';
		        	inputPass2.style.borderColor = 'red';
					resultPass2.style.color = 'red';
		        	resultPass2.textContent = "비밀번호가 일치하지 않습니다.";
		        	isPassOk2 = false;
		        } else {
		        	inputPass1.style.borderColor = '#ccc';
					resultPass1.textContent = '';
		        	isPassOk2 = true;
		        } // 일치 end
		        
			} // 유효성 end
		}
		
		// 최종 전송
		btn.addEventListener("click", function() {
			const password = inputPass1.value;
			
			if(!isPassOk1){
				alert('새 비밀번호를 확인해주세요.');
				return;
			}
			if(!isPassOk2){
				alert('새 비밀번호 확인을 확인해주세요.');
				return;
			}
			
			fetch('/user/findPwdChange',{
				method: "POST",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
				body: JSON.stringify({
					password: password,
				}),
			}).then((response) => response.text())
			.then((data) => {
				console.log(data);
				
				if(data >= 1){
					alert('비밀번호가 변경되었습니다.');
					window.location.href='/';
				}
				
			})
			.catch((error) => {
				alert('비밀번호를 변경하는데 문제가 발생했습니다');
				console.log(error);
			});
			
		});
	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


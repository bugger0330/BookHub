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

.email-auth-form > form:nth-last-of-type(1) > .log-form-group {
	display: none;
}

.log-form-group:nth-last-child(1) {
	position: relative;
}
.result-email {
	margin-top: 10px;
}
.p-timer {
	position: absolute;
    right: 37px;
    top: 40px;
    font-weight: bold;
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
					<button type="button" class="auth-email" onclick="valiEmail()">인증하기</button>
					<p class="result-email"></p>
				</div>
			</form>
			<!-- 인증 확인 -->
			<form action="#">
				<div class="log-form-group">
					<label for="authNumber">인증번호</label> <input type="text" id="auth-number"
						name="authNumber" placeholder="Enter number" class="input-authNumber" required>
						<button type="button" class="btn-complete" onclick="EnterNumber()">완료</button>
						<p class="p-timer">3:00</p>
				</div>
			</form>
		</div>
		<div class="change-find">
			<a href="/user/findPwd">-> 비밀번호 변경하기</a> <br>
			<span>비밀번호를 잊어버리셨나요?</span>
		</div>
	</div>

	<script>
	
		// 이메일 초기화
		localStorage.removeItem("email");
		
		// 이메일 인증
		const inputEmail = document.getElementById('email');
		const authNumber = document.getElementById('auth-number');
		const btnEmail = document.getElementsByClassName('auth-email')[0];
		const btnNum = document.getElementsByClassName('btn-complete')[0];
		const divNum = document.getElementsByClassName('log-form-group')[1];
		const resultEmail = document.getElementsByClassName('result-email')[0];
		const emailTime = document.getElementsByClassName('p-timer')[0];
		
		const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 시간 변수
		let countTime = 0;
		let intervalCall;
		
		// 이메일
		function valiEmail() {
			const email = inputEmail.value;
			if(!email.match(reEmail)) {
				inputEmail.style.borderColor = 'red';
				resultEmail.style.display = 'block';
				resultEmail.style.color = 'red';
				resultEmail.textContent = '이메일 주소를 정확하게 입력해주세요.';
				isEmailOk = false;
			} else {
				inputEmail.style.borderColor = '#ccc';
				resultEmail.textContent = '';
				authEmail(email);
			}
		}
		
		
		// 이메일 인증
		function authEmail(email) {
			console.log("email : "+email);
			divNum.style.display = 'block';
			fetch('/findId/sendEmail',{
				method: "POST",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
				body: JSON.stringify({
				    email: email,
				}),
			}).then((response) => response.text())
			.then((data) => {
				console.log(data);
				
				if(data != null){
					divNum.style.display = 'block';
					window.localStorage.setItem('email', data);
				} else {
					alert("이메일 전송을 실패하였습니다.");
					resultEmail.textContent = '';
				}
				
			})
			.catch((error) => {
				alert('이메일 인증을 실패했습니다.');
				console.log(error);
			});
			
		}
		
		// 인증 코드 입력
		function EnterNumber() {
			const num = authNumber.value;
			
			if(emailTime.textContent === '0:00') {
				alert('입력 시간이 지났습니다. 다시 코드를 발급해주세요.');
				return;
			}

			fetch(`/findId/authNumber?number=`+num,{
				method: "GET",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
			}).then((response) => response.text())
			.then((data) => {
				console.log('number : '+data);
				if(data <= 0){
					alert("인증 코드를 다시 입력해주세요.");
				} else {
					alert("인증되었습니다.");
					closeTime();
					window.location.href='/user/findIdResult';
				}
			})
			.catch((error) => {
				alert('인증 번호에 문제가 발생했습니다.');
				window.localStorage.removeItem('email');
				console.log(error);
			});
		}
	    
		
		// 타이머 시작
		function time(time) {
		    countTime = time;
		    intervalCall = setInterval(alertFunc, 1000);
		}
		
		// 시간 끝내기
		function closeTime() {
		    clearInterval(intervalCall);
		}

		// 타이머 보이기
		function alertFunc() {
			let min = Math.floor(Math.max(0, countTime) / 60); // 음수인 경우 0으로 처리
		    let sec = Math.max(0, countTime) - (60 * min); // 음수인 경우 0으로 처리
		    if (sec > 9) {
		    	emailTime.textContent = min + ':' + sec;
		    } else {
		    	emailTime.textContent = min + ':0' + sec;
		    }
		    
		    if (countTime <= 0) {
		        clearInterval(intervalCall);
		    }
		    countTime--;
		}
		
		// 이메일 전송 버튼 클릭 후 time
		btnEmail.addEventListener("click", function() {
			time(179);
		});
	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


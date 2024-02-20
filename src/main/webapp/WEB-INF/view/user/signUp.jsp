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
		<form action="/signUp" method="post">
			<div class="log-form-group div-uid-input">
				<label for="uid"><span class="essential">*</span> 아이디</label> <input type="text" id="uid"
					name="uid" placeholder="Enter uid" class="input-id" required>
				<button type="button" class="check-id">중복체크</button>
				<p class="result-uid"></p>
			</div>
			<div class="log-form-group">
				<label for="password"><span class="essential">*</span> 비밀번호</label> <input type="password" id="password"
					name="password" placeholder="Enter password" onblur="valiPass()" required>
				<p class="result-pass"></p>
			</div>
			<div class="log-form-group">
				<label for="name"><span class="essential">*</span> 이름</label> <input type="text" id="name"
					name="name" onblur="valiName()" placeholder="Enter name" required>
				<p class="result-name"></p>
			</div>
			<div class="log-form-group">
				<label for="email"><span class="essential">*</span> 이메일</label> <input type="email" id="email"
					name="email" placeholder="Enter email" class="input-email" onblur="valiEmail()" required>
				<button type="button" class="auth-email">인증하기</button>
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
						<input type="radio" id="gender1" class="blind" name="gender" value="1" required>
						<label for="gender1">남자</label>
					</li>
					<li class="radio-item">
						<input type="radio" id="gender2" class="blind" name="gender" value="2" required>
						<label for="gender2">여자</label>
					</li>
				</ul>
				<p class="result-gender"></p>
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
				<button type="submit" id="btn-form">회원가입</button>
			</div>
		</form>
	</div>
	
	<script>
		
		// 검사 결과 내용
		const NOT_CONFIRM_UID	= '중복된 아이디입니다.';
		const VALIDATION_UID	= '영문, 숫자로 4~12자리까지 설정해 주세요.';
		const VALIDATION_PASS	= '비밀번호는 숫자, 영문, 특수문자 조합 8~12자리 이상이어야 합니다.';
		const VALIDATION_NAME	= '한글, 영문 대/소문자를 사용해 주세요. (특수기호, 공백 사용 불가)';
		const VALIDATION_HP		= '하이픈(-)을 포함하여 휴대전화번호를 정확하게 입력해주세요.';
		const VALIDATION_EMAIL	= '이메일 주소를 정확하게 입력해주세요.';	

		// 검증 상태변수
		let isUidOk		= false;
		let isPassOk	= false;
		let isNameOk	= false;
		let isGenderOk  = false;
		let isEmailOk	= false;
		let isHpOk		= false;
		let isBirthOk   = false;

		// 정규표현식
		const reUid   = /^[a-z]+[a-z0-9]{4,12}$/g;
		const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,12}$/;
		const reName  = /^[가-힣]{2,10}$/
		const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
		
		const resultUid = document.getElementsByClassName("result-uid")[0];
		const btnId = document.getElementsByClassName("check-id")[0];
		const inputId = document.getElementById('uid');

		const btnSubmit = document.getElementById('btn-form');

		// 아이디 찾기
		btnId.addEventListener('click', function(e) {
			const uid = inputId.value;
			console.log(uid);
			
			if(!uid.match(reUid)){
				inputId.style.borderColor = 'red';
				resultUid.style.display = 'block';
				resultUid.style.color = 'red';
				resultUid.textContent = VALIDATION_PASS;
				return;
			}

			fetch(`/user/confirmId/${uid}`,{
				method: "POST",
				headers: {
					"Content-Type": "application/json;charset=UTF-8",
				},
			}).then((response) => response.json())
			.then((data) => {
				if(data >= 1) {
					inputId.style.borderColor = 'red';
					resultUid.style.display = 'block';
					resultUid.style.color = 'red';
					resultUid.textContent = NOT_CONFIRM_UID;
				} else {
					inputId.style.borderColor = '#ccc';
					resultUid.textContent = '';
				}
			})
			.catch((error) => {
				alert('아이디를 확인할 수 없습니다.');
				console.log(error);
			});
		}); 
		
		/* 유효성 검사 */
		const resultPass = document.getElementsByClassName("result-pass")[0];
		const inputPass = document.getElementById('password');
		const resultName = document.getElementsByClassName("result-name")[0];
		const inputName = document.getElementById('name');
		const resultEmail = document.getElementsByClassName("result-email")[0];
		const inputEmail = document.getElementById('email');
		const resultHp = document.getElementsByClassName("result-hp")[0];
		const inputHp = document.getElementById('hp');
		
		// 비밀번호
		function valiPass() {
			const password = inputPass.value;
			
			if(!password.match(rePass)) {
				inputPass.style.borderColor = 'red';
				resultPass.style.display = 'block';
				resultPass.style.color = 'red';
				resultPass.textContent = VALIDATION_PASS;
			} else {
				inputPass.style.borderColor = '#ccc';
				resultPass.textContent = '';
			}
		}

		// 이름
		function valiName() {
			const name = inputName.value;
			if(!name.match(reName)) {
				inputName.style.borderColor = 'red';
				resultName.style.display = 'block';
				resultName.style.color = 'red';
				resultName.textContent = VALIDATION_NAME;
			} else {
				inputName.style.borderColor = '#ccc';
				resultName.textContent = '';
			}
		}

		// 이메일
		function valiEmail() {
			const email = inputEmail.value;
			if(!email.match(reEmail)) {
				inputEmail.style.borderColor = 'red';
				resultEmail.style.display = 'block';
				resultEmail.style.color = 'red';
				resultEmail.textContent = VALIDATION_EMAIL;
			} else {
				inputEmail.style.borderColor = '#ccc';
				resultEmail.textContent = '';
			}
		}

		// 휴대폰 번호
		function valiHp() {
			const hp = inputHp.value;
			if(!hp.match(reHp)) {
				inputHp.style.borderColor = 'red';
				resultHp.style.display = 'block';
				resultHp.style.color = 'red';
				resultHp.textContent = VALIDATION_HP;
			} else {
				inputHp.style.borderColor = '#ccc';
				resultHp.textContent = '';
			}
		}

		
	</script>

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
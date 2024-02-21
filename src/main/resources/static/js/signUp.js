// 검사 결과 내용
const NOT_CONFIRM_UID	= '중복된 아이디입니다.';
const CONFIRM_UID	= '사용가능한 아이디입니다.';
const VALIDATION_UID	= '영문, 숫자로 4~12자리까지 설정해 주세요.';
const VALIDATION_PASS	= '숫자, 영문, 특수문자 등을 조합하여 8~12자리까지 설정해 주세요.';
const VALIDATION_NAME	= '이름은 한글로 입력해 주세요. (특수기호, 공백 사용 불가)';
const VALIDATION_HP		= '하이픈(-)을 포함하여 휴대전화번호를 정확하게 입력해주세요.';
const VALIDATION_EMAIL	= '이메일 주소를 정확하게 입력해주세요.';	

// 검증 상태변수
let isUidOk		= false;
let isPassOk	= false;
let isNameOk	= false;
let isGenderOk  = false;
let isEmailOk	= false;
let isHpOk		= false;

// 정규표현식
const reUid   = /^[a-z]+[a-z0-9]{4,12}$/g;
const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,12}$/;
const reName  = /^[가-힣]{2,10}$/
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

const resultUid = document.getElementsByClassName("result-uid")[0];
const btnId = document.getElementsByClassName("check-id")[0];
const inputId = document.getElementById('uid');


// 아이디 값 조작 방지
inputId.addEventListener('keydown',function(e){
	inputId.style.borderColor = '#ccc';
	resultUid.style.display = 'none';
	resultUid.textContent = '';
	isUidOk = false;
});

// 아이디 찾기
btnId.addEventListener('click', function(e) {
	const uid = inputId.value;
	console.log(uid);
	
	if(!uid.match(reUid)){
		inputId.style.borderColor = 'red';
		resultUid.style.display = 'block';
		resultUid.style.color = 'red';
		resultUid.textContent = VALIDATION_UID;
		isUidOk = false;
		return;
	}

	fetch(`/user/confirmId/`+uid,{
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
			isUidOk = false;
		} else {
			inputId.style.borderColor = 'green';
			resultUid.style.display = 'block';
			resultUid.style.color = 'green';
			resultUid.textContent = CONFIRM_UID;
			isUidOk = true;
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
const inputGender = document.getElementsByName('gender');

// 비밀번호
function valiPass() {
	const password = inputPass.value;
	
	if(!password.match(rePass)) {
		inputPass.style.borderColor = 'red';
		resultPass.style.display = 'block';
		resultPass.style.color = 'red';
		resultPass.textContent = VALIDATION_PASS;
		isPassOk = false;
	} else {
		inputPass.style.borderColor = '#ccc';
		resultPass.textContent = '';
		isPassOk = true;
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
		isNameOk = false;
	} else {
		inputName.style.borderColor = '#ccc';
		resultName.textContent = '';
		isNameOk = true;
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
		isEmailOk = false;
	} else {
		inputEmail.style.borderColor = '#ccc';
		resultEmail.textContent = '';
		isEmailOk = true;
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
		isHpOk = false;
	} else {
		inputHp.style.borderColor = '#ccc';
		resultHp.textContent = '';
		isHpOk = true;
	}
}

// 성별
function checkGender() {
	for(let gender of inputGender) {
		if (gender.checked) {
    		console.log(gender.value);
			isGenderOk = true;
		}
	}
}

const btnForm = document.getElementsByClassName('btn-form')[0];
// 최종 전송
btnForm.addEventListener('click',function(e) {
	
	if(!isUidOk){
		alert('아이디를 확인 하십시요.');
		e.preventDefault(); 
		return false;
	}

	if(!isPassOk){
		alert('비밀번호를 확인 하십시요.');
		e.preventDefault(); 
		return false;
	}

	if(!isNameOk){
		alert('이름를 확인 하십시요.');
		e.preventDefault(); 
		return false;
	}

	if(!isEmailOk){
		alert('이메일을 확인 하십시요.');
		e.preventDefault(); 
		return false;
	}

	if(!isHpOk){
		alert('번호를 확인 하십시요.');
		e.preventDefault(); 
		return false;
	}

	if(!isGenderOk) {
		alert('성별을 선택 하십시요.');
		e.preventDefault(); 
		return false;
	}

	return true;
});

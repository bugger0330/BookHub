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
				
				if(data >= 1){
					alert('비밀번호가 변경되었습니다.');
					window.location.href='/';
				}
				
			})
			.catch((error) => {
				alert('비밀번호를 변경하는데 문제가 발생했습니다');
			});
			
		});
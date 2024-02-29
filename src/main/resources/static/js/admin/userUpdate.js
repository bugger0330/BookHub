$(document).ready(function() {
			$('#edit-btn').submit(function(event) {
				if (!validateForm()) {
					event.preventDefault(); // 양식 제출 방지
				} else {
					// 수정하시겠습니까? 얼럿 창 표시
					if (!confirm('수정하시겠습니까?')) {
						
						event.preventDefault(); // 양식 제출 방지
						
					}
				}
			});

			$('#delete-btn').submit(function(event) {
				if (!confirm('정말로 삭제하시겠습니까?')) {
					event.preventDefault(); // 양식 제출 방지
					
				}
			});

			$('#edit-btn').on('click', function() {
				$('.alert').alert('close'); // 이전에 표시된 얼럿 창 숨기기
			});

			function validateForm() {
				let isValid = true;

				// 아이디 유효성 검사
				let usernameInput = $('#username').val();
				let koreanRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if (koreanRegex.test(usernameInput)) {
					$('#username').addClass('is-invalid');
					$('#usernameFeedback').text('한글은 입력할 수 없습니다.');
					isValid = false;
				} else {
					$('#username').removeClass('is-invalid');
					$('#usernameFeedback').text('');
				}

				// 연락처 유효성 검사
				let phoneInput = $('#phone').val();
				let phoneRegex = /^[0-9]*$/;
				if (!phoneRegex.test(phoneInput)) {
					$('#phone').addClass('is-invalid');
					$('#phoneFeedback').text('숫자만 입력 가능합니다.');
					isValid = false;
				} else {
					$('#phone').removeClass('is-invalid');
					$('#phoneFeedback').text('');
				}

				// 우편번호 유효성 검사
				let zipInput = $('#zip').val();
				if (!phoneRegex.test(zipInput)) {
					$('#zip').addClass('is-invalid');
					$('#zipFeedback').text('숫자만 입력 가능합니다.');
					isValid = false;
				} else {
					$('#zip').removeClass('is-invalid');
					$('#zipFeedback').text('');
				}

				// 얼럿 창 표시
				if (!isValid) {
					alert('양식을 올바르게 입력해주세요.');
				}

				return isValid;
			}
		});

		$(document).ready(function() {
			// 이하 생략
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
					// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				}
			});
			// 주소찾기 버튼 클릭 이벤트 핸들러
			$('#find-address-btn').on('click', function() {
				new daum.Postcode({
					oncomplete : function(data) {
						// 주소 검색 결과가 선택되었을 때 실행되는 부분
						// 검색 결과를 사용자가 선택한 값을 입력 폼에 채워넣는 등의 동작을 여기에 추가할 수 있습니다.
						$('#zip').val(data.zonecode); // 우편번호 입력 폼에 우편번호 값 채우기
						$('#addr1').val(data.address); // 주소 입력 폼에 주소 값 채우기
					}
				}).open();
			});
		});
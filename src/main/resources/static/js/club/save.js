
window.onload = function() {
	
	const button = document.getElementById('form--button');
	const confirmBtn = document.getElementById('confirmPointBtn');
	const inputs = document.querySelectorAll("input");
	const select = document.querySelector("select");
	const textareas = document.querySelectorAll("textarea");
	
	button.addEventListener('click', function(e) {
		
		if(inputs[0].value == "") {
			// focus를 alert 보다 먼저 입력해도 alert 띄우고 focus 되네
			alert("독서모임명을 입력하세요");
			inputs[0].focus();
			//return으로 메서드 종료시켜야 모달이 안 뜬다 / return 없으면 alert뜨고 확인하면 바로 모달 떠버림
			return;
		}
		if(inputs[1].value == "") {
			alert("주최자를 입력하세요");
			inputs[1].focus();
			//return으로 메서드 종료시켜야 모달이 안 뜬다
			return;
		}
		if(inputs[2].value == "") {
			alert("최대인원을 입력하세요");
			inputs[2].focus();
			return;
		}
		if(inputs[3].value == "") {
			alert("모임날짜를 입력하세요");
			inputs[3].focus();
			return;
		}
		if(select.value == "") {
			alert("카테고리를 입력하세요");
			select.focus();
			return;
		}
		if(inputs[4].value == "") {
			alert("이미지를 첨부하세요");
			inputs[4].focus();
			return;
		}
		if(textareas[0].value == "") {
			alert("모임소개를 입력하세요");
			textareas[0].focus();
			return;
		}
		if(textareas[1].value == "") {
			alert("모임내용을 입력하세요");
			textareas[1].focus();
			return;
		}
		// 현재 시간 이후 선택하도록 유효성 검사
		// 둘 다 문자열인데, 문자열끼리 비교할 때는 사전적 순서 따름
		// ex) "2024-02-28T12:00"와 "2024-02-28T13:00"을 비교할 때 true를 반환
		// getToday() 메서드의 위치는 맨 아래
		if(inputs[3].value <= getToday()) { 
			alert("현재 시각 이후 날짜를 선택하세요");
			inputs[3].focus();
			// return 왜 안 먹지, 신기하넹
			return;
		}
		
		
		// button의 submit 기능 막기
		e.preventDefault();
		// 모달 띄우기
		$('#pointModal').modal('show');
	}) // button click end
	
	// 포인트 사용 확인 버튼 클릭 시 폼 제출
	confirmBtn.addEventListener('click', function() {
		
		//alert('확인클릭');
		// 모달 닫기
		$('#pointModal').modal('hide');
		
		// 포인트 부족 모달
		const falseModal = document.getElementById('falseModal');
		// 폼 데이터 생성
		//태그 하나만 있을 때 querySelector 사용
		var form = document.querySelector('form');
		var formData = new FormData(form);
		
		/*let fileValue = "";
		const shareInfo = {
			clubName: inputs[0].value,
			host: inputs[1].value,
			headCount: inputs[2].value,
			cDate: inputs[3].value,
			clubCate: select.value,
			descript: textareas[0].value,
			detail: textareas[1].value,
		}
		// Blob은 뭐지?
		formData.append("shareInfo", new Blob([JSON.stringify(shareInfo)], {type: "application/json"}));
    	formData.append("file", fileValue);
		*/
		
		$.ajax({
			// url 에 "" 안붙여서 모달 안 떴던 거!!!!
			url: '/club/save',
			type: 'post',
			data: formData,
			contentType: false,
			processData: false,
			enctype: 'multipart/form-data',
			
			success: function(data) {
				
				if(data == true) {
					alert('개설 완료입니다');
					location.replace("/club/saveList");
				} else {
					// 안되노!!! -> falseModal.style.display = 'block';
					//alert('포인트가 부족합니다');
					$('#falseModal').modal('show');
				}
			},
			error: function() {
				alert('에러');
			}
		});
	})// confirmBtn click end
	
	// 파일 미리보기 기능
	const inputFile = document.getElementById('customFile');
	
	inputFile.onchange = () => {
		//alert('파일 선택');
		
		var preview = document.getElementById('preview');
		// 선택된 파일중에 첫 번째 요소 가리킴
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();
		
		if(file) {
			reader.readAsDataURL(file);
		}else {
			preview.src = "";
			preview.style.display = "none"; // null
		}
		
		// 파일 선택하여 읽기 작업 완료시(선택된 파일없으면 아래 이벤트 발생하지 않음)
		reader.onloadend = function() {
			preview.src = reader.result;
			preview.style.display = "block";
		}
	}// inputFile.onchange end
	
	// 오늘의 날짜를 가져오기 위한 함수
	function getToday() {
		var today = new Date();
		var year = today.getFullYear();
		// getMonth() 하면 0~11까지 나옴 ex) 지금 2월이면 1이 나옴
		var month = today.getMonth() + 1;
		var day = today.getDate();
		var hours = today.getHours();
		var minutes = today.getMinutes();
		// 형식 "YYYY-MM-DDTHH:MM" 지켜야 날짜로 인식한다
		var todayString = year + '-' + 
		(month < 10 ? '0' + month : month) + '-' + 
		(day < 10 ? '0' + day : day) + 'T' + 
		(hours < 10 ? '0' + hours : hours) + ':' + 
		(minutes < 10 ? '0' + minutes : minutes);
		
		return todayString;
	}
	
	var datetimeInput = document.getElementById('datetime');
	// 최솟값을 내가 작성한 문자열로 설정
	datetimeInput.min = getToday();
	
	
	
	
} // window.onload end

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
			//return으로 메서드 종료시켜야 모달이 안 뜬다
			return;
		}
		if(inputs[1].value == "") {
			alert("주최자를 입력하세요");
			inputs[0].focus();
			//return으로 메서드 종료시켜야 모달이 안 뜬다
			return;
		}
		if(inputs[2].value == "") {
			alert("최대인원을 입력하세요");
			inputs[0].focus();
			return;
		}
		if(inputs[3].value == "") {
			alert("모임날짜를 입력하세요");
			inputs[0].focus();
			return;
		}
		if(select.value == "") {
			alert("카테고리를 입력하세요");
			inputs[0].focus();
			return;
		}
		if(inputs[4].value == "") {
			alert("이미지를 첨부하세요");
			inputs[0].focus();
			return;
		}
		if(textareas[0].value == "") {
			alert("모임소개를 입력하세요");
			inputs[0].focus();
			return;
		}
		if(textareas[1].value == "") {
			alert("모임내용을 입력하세요");
			inputs[0].focus();
			return;
		}
		
		
		
		// button의 submit 기능 막기
		e.preventDefault();
		// 모달 띄우기
		$('#pointModal').modal('show');
	})
	
	// 포인트 사용 확인 버튼 클릭 시 폼 제출
	confirmBtn.addEventListener('click', function() {
		
		alert('확인클릭');
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
					alert('포인트 사용 완료');
					location.replace("/club/index");
				} else {
					// 안되노!!! -> falseModal.style.display = 'block';
					alert('포인트 부족');
					$('#falseModal').modal('show');
				}
			},
			error: function() {
				alert('에러');
			}
		});
	})
}
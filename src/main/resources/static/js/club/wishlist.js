
window.onload = function() {
	
	// 찜하기 기능
	const wishBtns = document.getElementsByName('wishButton');
	
	for(let i=0 ; i<wishBtns.length ; i++) {
		
		wishBtns[i].addEventListener('click', function(e) {
			
			const clubId = e.target.getAttribute('data-id');
			
			e.preventDefault();
			alert('clubId : ' + clubId);
			
			// 인증검사
			
			// 하트가 비어있으면
			$.ajax({
				url : '/club/wish',
				type : 'post',
				data : {clubId : clubId}, // [] 아님
				
				success : function(data) {
					
					if(data == true) {
						alert("찜하기 완료");
						// 하트의 클래스를 변경하여 색상을 채움
						e.target.classList.remove('bi-heart');
						e.target.classList.add('bi-heart-fill');
					}else {
						alert("찜하기 실패");
					}
					
				},
				error : function() {
					alert('에러');
				}
			})
			
			// 하트가 채워져있으면
			
			
		})
		
		// 찜하기 여부에 따라 다르게 표시(반복문 이용해서 ajax전송)
		$.ajax({
			url : '/club/checkWish',
			type : 'post',
			data : {clubId : wishBtns[i].getAttribute('data-id')}, // target 빼기
			
			success : function(data) {
				
				console.log("clubId : " + wishBtns[i].getAttribute('data-id'));
				
				if(data == true) {
					// 하트의 클래스를 변경하여 색상을 채움
					wishBtns[i].classList.remove('bi-heart');
					wishBtns[i].classList.add('bi-heart-fill');
				}else {
					
				}
			},
			error : function() {
					alert('에러');
			}
		})
		
		
		
	}
	
	
	
	
	
}
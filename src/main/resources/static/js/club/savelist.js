
window.onload = function() {
	
	const buttons = document.querySelectorAll('.btn'); // 클래스 이름 이렇게만 적어도 되는강?? ㅇㅇ
	// 모달 확인버튼
	const deleteBtn = document.getElementById('confirmDeleteBtn');
	
	for(let i=0 ; i<buttons.length ; i++) {
		
		buttons[i].addEventListener('click', function(e) {
			
			//alert('클릭');
			
			// Attribute가 아니고 getAttribute
			const id = e.target.getAttribute('data-id');
			
			$('#deleteModal').modal('show');
			
			deleteBtn.addEventListener('click', function() {
				
				$('#deleteModal').modal('hide');
	
				// id값 받기 위해서 deleteBtn이벤트가 button[]이벤트 안에 있어야함
				//alert('id : ' + id);
				
				$.ajax({
					url : '/club/save',
					type : 'delete',
					data : {
						id : id
					},
					
					success : function(data) {
						
						if(data == true) {
							alert('개설취소 완료');
							location.reload();
						}else {
							alert('신청인원이 있으므로 관리자 승인이 필요합니다');
						}
					},
					error : function() {
						alert('에러');
					}
					
				});
			
			}) 
		})
	}
	
	// 모달 취소버튼 누르고 다른 독서모임 삭제하려고 하면 id 값 이전 꺼 자꾸 뜸
	// 모달 취소버튼 클릭시 reload해서 해결(닫기 버튼도 똑같이 적용)
	const cancelDeleteBtn = document.getElementById('cancelDeleteBtn');
	const close = document.getElementById('close');
	
	cancelDeleteBtn.addEventListener('click', function() {
		
		location.reload();
	})
	 
	close.addEventListener('click', function() {
		
		location.reload();
	})
	

	
}

window.onload = function() {
	
	//  개설취소 버튼
	const deleteBtns = document.getElementsByName('deleteButton'); // 클래스 이름 이렇게만 적어도 되는강?? ㅇㅇ
	// 모달 확인버튼
	const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
	
	for(let i=0 ; i<deleteBtns.length ; i++) {
		
		deleteBtns[i].addEventListener('click', function() {
			
			const id = this.getAttribute('data-id');
			// 개설취소 버튼 누를 때마다, 확인버튼에 사용자 정의 속성 값 변경됨
			confirmDeleteBtn.setAttribute('data-id', id);
			
			//alert('id : ' + id);
			
			$('#deleteModal').modal('show');
		})
	} // for문 끝
		
		// 모달 확인버튼
		confirmDeleteBtn.addEventListener('click', function() {
			
			// 사용자 정의 속성 지정한 것 가져오기	
			const id = this.getAttribute('data-id');
			//alert('id : ' + id);
			
			$('#deleteModal').modal('hide');

			$.ajax({
				url : '/club/save',
				type : 'delete',
				// 반복문에서 i값에 따라 가리키는 버튼을 이용해서, 사용자 속성 가져오기
				data : {id : id},
				
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
		
}
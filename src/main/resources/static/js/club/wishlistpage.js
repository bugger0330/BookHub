
window.onload = function() {
	
	const wishBtn = document.getElementsByName('wishButton');
	
	for(let i=0 ; i<wishBtn.length ; i++) {
		
		wishBtn[i].addEventListener('click', function(e) {
			
			const clubId = e.target.getAttribute('data-id');
			
			// a태그로 둘러싸여있어서 a태그 기능 막기
			e.preventDefault();
			//alert('clubId : ' + clubId);
			
			$.ajax({
					url : '/club/wish',
					type : 'delete',
					data : {clubId : clubId},
					
					success : function(data) {
						if(data == true) {
							alert('찜하기 취소');
							// reload해서 찜하기 취소한 항목 없애기
							location.reload();
						}else {
							
						}
					},
					error : function() {
						alert('에러');
					}
				})
		})
	}
}
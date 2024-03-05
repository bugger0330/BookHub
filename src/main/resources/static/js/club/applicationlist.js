
window.onload = function() {
	
 // ClassName이라 클래스 구분하는 . 안붙여도 됨		
 const buttons = document.getElementsByClassName('btn btn-primary'); 
 
 for(i=0 ; i<buttons.length ; i++) {
	 
	 buttons[i].addEventListener('click', function(e) {
		 
		 // a 태그의 사용자정의속성 이용
		 const id = e.target.getAttribute('data-id');
		 const clubId = e.target.getAttribute('data-clubId');
		 
		 //alert('id, clubId : ' + id + ' ' + clubId);
		 //console('id : ' + id);
		 //console("clubId : " + clubId);
		 
		 if(confirm('취소하시겠습니까?')) {
			 
			$.ajax({
			
				url : "/club/apply",
				type : "delete",
				data : {
					id : id,
					clubId : clubId
				},
				
				success : function(data) {
					
					if(data == true) {
						alert('취소완료입니다');
						// reload는 안되고 reload()만됨
						location.reload();
					} else {
						alert('취소 실패');
					}
					
				},
				error : function() {
					alert('에러');
				}
			});
		 }
	 })
 }	
}
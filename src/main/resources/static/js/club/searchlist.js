
/* ajax, form 전송 둘 중에 선택해야 하는데 Request Cotnroller 로 할거아니면
form 전송임

window.onload = function() {
	
	const clubName = document.getElementById('search--input').val();
	const searchBtn = document.getElementById('search--input--button');
	
	searchBtn.addEventListener('click', function() {
		
		//alert('검색버튼 클릭');
		console.log('clubName : ' + clubName);
		
		$.ajax({
			
			type: 'get',
			url: '/club/searchList',
			data : {clubName : clubName},
			
			success: function(data) {
				
			}
			
		});
	})
}
*/
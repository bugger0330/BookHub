
window.onload = function() {
	
	const searchInput = document.getElementById('searchInput');
	const searchBtn = document.querySelector('button');
	const form = document.querySelector('form');
	
		// 검색 버튼 클릭이벤트로 하면 button의 타입이 submit이라 e.preventDefault 작동 안됨
		form.addEventListener('submit', function(e) {
			
			if(searchInput.value == "") {
				
				// 폼전송 막기
				e.preventDefault();
				//alert('클릭');
				
				$('#searchModal').modal('show');
			}
		})
		
		
		/*searchBtn.addEventListener('click', function(e) {
		
			// .val, .value() 전부 아님 
			if(searchInput.value == "") {
				
				e.preventDefault();
			
				alert('클릭');
			}
		
		})*/
}
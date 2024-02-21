
// window.onload
window.onload = function(){
	
	// getElementById
	const applyBtn = document.getElementById('apply--button');
	const clubId = document.getElementById('club--id').innerText;
	//const clubId = document.getElementById('club--id').value;
	let userName = "user2";
	
	// addEventListener 깜빡하지 않기!!
	applyBtn.addEventListener('click', () => {
		
		
		alert('clubId : ' + clubId);
		
		if(userName != null) {
			
			$.ajax({
				type : "post",
				url : "/club/apply",
				data : {
					clubId : clubId,
					userName : userName
				},
				
				// controller 에서 리턴한 값 data로
				success : function(data) {
					console.log(data);
					if(data == true) {
						alert('신청완료');
					} else {
						alert('신청실패');
					}
				},
				error : function() {
					alert('에러');
				}
			});
		}
	})
}
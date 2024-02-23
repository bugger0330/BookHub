
// window.onload
window.onload = function(){
	
	// getElementById
	const applyBtn = document.getElementById('apply--button');
	//const clubId = document.getElementById('club--id').innerText; // 타입이 String이 되네
	const clubId = document.getElementById('club--id').value;
	//let userName = null;
	let userName = "user2";
	
	// hcApply가 headCount값과 같으면 신청하기 -> 마감으로 변경		
	const clubHcApply = document.getElementById('club--hcapply').value;
	const clubHeadCount = document.getElementById('club--headcount').value;
	const clubStatus = document.getElementById('club-status');
	
	if(clubHcApply == clubHeadCount) {
		applyBtn.innerText = "마감";
		clubStatus.hidden = true;
	}
	
	// addEventListener 깜빡하지 않기!!
	applyBtn.addEventListener('click', () => {
		
		//alert('clubId : ' + clubId);
		
		// 로그인 안 한 회원이면 로그인페이지로 이동
		if(userName == null) {
			
			// 로그인 완료되면 다시 상세페이지로 로드할 것
			location.replace("/login");
		}
		
		if(userName != null) {
			
			console.log('clubHcApply : ' + clubHcApply);
			console.log('clubHeadCount : ' + clubHeadCount);
			
			// 신청인원수가 정원보다 적을 때
			// 자바스크립트의 변수는 기본적으로 String이므로 숫자로 변환해줘야함
			if(Number(clubHcApply) < Number(clubHeadCount)) {
				
				alert('if문 정상 작동');
				
					if(confirm('신청하시겠습니까?')) {
					
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
									alert('신청완료입니다');
									
									// 경로 변경 (상세페이지에서 하면 상세페이지로, index 페이지에서 하면 index페이지로)
									//location.replace("/club/index");
									
								} else {
									// 이미 신청한 유저면 이미신청한 회원입니다 alert 띄우기
									alert('이미 신청한 모임입니다');
								}
							},
							error : function() {
								alert('에러');
							}
						});
					} else {
						//alert('취소');
					}
				// 신청인원수가 정원과 같을 때
				}else {
					alert('마감된 모임입니다');
				}
		}
	})
	
	
	
	
	
	
	
}
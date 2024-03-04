
// window.onload
window.onload = function(){
	
	// getElementById
	const applyBtn = document.getElementById('apply--button');
	//const clubId = document.getElementById('club--id').innerText; // 타입이 String이 되네
	const clubId = document.getElementById('club--id').value;
	// userName 임의 설정
	//let userName = null;
	//let userName = "user11";
	//const userName = document.getElementById('username').value;
	
	// hcApply가 headCount값과 같으면 신청하기 -> 마감으로 변경		
	const clubHcApply = document.getElementById('club--hcapply').value;
	const clubHeadCount = document.getElementById('club--headcount').value;
	const clubStatus = document.getElementById('club-status');
	
	if(clubHcApply == clubHeadCount) {
		applyBtn.innerText = "마감";
		clubStatus.hidden = true;
	}
	
	// addEventListener 깜빡하지 않기!!
	applyBtn.addEventListener('click', (e) => {
		
		const userName = e.target.getAttribute('data-username');
		//alert('clubId : ' + clubId);
		//alert('userName : ' + userName);
		//console.log('userName : ' + userName);
		
		// 로그인 안 한 회원이면 로그인페이지로 이동
		// 자바스크립트는 html에서 null로 리턴해도 빈문자열로 처리한다!!!
		if(userName == "") {
			
			// 로그인 완료되면 다시 상세페이지로 로드할 것
			location.replace("/login");
		}
		
		if(userName != "") {
			
			console.log('clubHcApply : ' + clubHcApply);
			console.log('clubHeadCount : ' + clubHeadCount);
			
			// 신청인원수가 정원보다 적을 때
			// 자바스크립트의 변수는 기본적으로 String이므로 숫자로 변환해줘야함!!!!!
			if(Number(clubHcApply) < Number(clubHeadCount)) {
				
				//alert('if문 정상 작동');
				
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
								//console.log(data);
								if(data == true) {
									alert('신청완료입니다');
									
									// 경로 변경 (상세페이지에서 하면 상세페이지로, index 페이지에서 하면 index페이지로)
									location.replace("/club/applicationList");
									
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
	}) // applyBtn click end
	
	
	// 찜하기 기능
	const wishBtns = document.getElementsByName('wishButton');
	
	for(let i=0 ; i<wishBtns.length ; i++) {
		
		wishBtns[i].addEventListener('click', function(e) {
			
			const clubId = e.target.getAttribute('data-id');
			const principal = e.target.getAttribute('data-principal');
			
			// a 태그로 둘러싸여 있어서 클릭하면 a태그 기능 발생하여 막음
			e.preventDefault();
			//alert('clubId : ' + clubId);
			
			// 인증검사
			if(principal == "") {
				location.replace("/login");
				return; // return 해줘야 밑으로 안 내려간다!
			}
			
			// 하트가 비어있으면
			if(e.target.classList.contains('bi-heart')) {
				
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
			}else {
				
				// 하트가 채워져있으면
				$.ajax({
					url : '/club/wish',
					type : 'delete',
					data : {clubId : clubId},
					
					success : function(data) {
						if(data == true) {
							alert('찜하기 취소');
							// 채워져있던 하트 빈하트로 변경
							e.target.classList.remove('bi-heart-fill');
							e.target.classList.add('bi-heart');
						}else {
							
						}
					},
					error : function() {
						alert('에러');
					}
				})
			}
			
		}) // click event end
		
		// 찜하기 여부에 따라 다르게 표시(반복문 이용해서 ajax전송)
		$.ajax({
			url : '/club/checkWish',
			type : 'post',
			data : {clubId : wishBtns[i].getAttribute('data-id')}, // target 빼기
			
			success : function(data) {
				
				// ajax 전송 후 성공했을 때 콘솔 찍힘
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
	} // for문 end
	
	
	
	
	
}
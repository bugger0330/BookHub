
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


	// 모임 인기순 목록 //
	const tab2Btn = document.getElementById('tab2--button');
	
	// wishBtns 전역변수로 위에서 선언해놔서 인덱스 아무거나 사용해서 data-principal 값 가져오기
	const principal = wishBtns[0].getAttribute('data-principal');
	
	tab2Btn.addEventListener('click', function() {
		
		//alert('principal : ' + principal);
		
		$.ajax({
			url : '/club/popular',
			// 데이터 가져올 땐 get 전송
			type : 'get',
			
			success : function(data) {
				//alert('성공1');
				console.log(data);
				
				if(data != null) {
					innerFun(data);
				}
				
			},
			error : function() {
				alert('에러');
			}
		})
	})
		
		
	function innerFun(data) {
		
		// += 연산자를 사용하여 변수에 문자열을 추가할 때에는 이미 변수가 선언되어 있어야 합니다.
		let html = '';
		
		if(data != null) {
			
			for(let i=0 ; i<data.length ; i++) {
				
			let setupClubImage = "/img/club/" + data[i].uploadFileName1;	
			
			// club entity에도 CDate로 저장되있는데 콘솔에 왜 cdate로 찍힐까??? cdate하니까 되네!!!!!
			let formattedDate = formatCDate(data[i].cdate);
		    
				
			// += 연산자를 사용하여 변수에 문자열을 추가할 때에는 이미 변수가 선언되어 있어야 합니다.	
			html += `
		                <div class="col-md-6 col-lg-4 col-xl-3">
		                    <a href="/club/view/${data[i].id}">
		                        <div class="rounded position-relative fruite-item">
		                            <div class="fruite-img">
		                                <img src="${setupClubImage}" class="img-fluid w-100 rounded-top" style="height: 380px;" alt="">
		                            </div>
		                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
		                                <h4 style="height: 50px;">${data[i].clubName}</h4>
		                                <h6>${data[i].host}</h6>
		                                <p style="height: 60px;">${data[i].descript}</p>
		                                <div class="d-flex justify-content-between flex-lg-wrap">
		                                    <p class="text-dark fs-5 fw-bold mb-0" style="margin-top: 5%;">${formattedDate}</p>
		                                    <i data-id="${data[i].id}" data-principal="${principal}" name="wishButton" class="bi-heart" style="font-size: 50px; cursor: default;"></i>
		                                </div>
		                            </div>
		                        </div>
		                    </a>
		                </div>
		            `;
			}
		}
		// 생성한 HTML을 화면에 추가
		// id값 clubList 태그에 추가함
		// empty() 중요!!! 이전에 있는 내용을 지우고 새로운 내용을 추가합니다
   		$('#clubList').empty().append(html);
	}
	
	function formatCDate(cDate) {
	    var date = new Date(cDate);
	    var days = ['일', '월', '화', '수', '목', '금', '토'];
	
	    var formattedDate = ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
	                        ('0' + (date.getDate())).slice(-2) + '(' +
	                        days[date.getDay()] + ') ' +
	                        ('0' + date.getHours()).slice(-2) + ':' +
	                        ('0' + date.getMinutes()).slice(-2);
	
	    return formattedDate;
	}

	
	// 테스트
	var cDate = "2024-03-24T06:00:00.000+00:00";
	console.log(formatCDate(cDate)); // 출력 예: "03-24(금) 06:00"	
		
		
		
		
		
		
		
		
		
		
		
		
}

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
		
		// 모임 인기순 목록
		const tab2Btn = document.getElementById('tab2--button');
		
		tab2Btn.addEventListener('click', function() {
			
			alert('클릭');
			
			$.ajax({
				url : '/club/popular',
				// 데이터 가져올 땐 get 전송
				type : 'get',
				
				success : function(data) {
					alert('성공1');
					// 서버로부터 받은 데이터(data)를 처리하여 HTML을 생성하는 코드
        			// 받은 데이터를 순회하면서 각 클럽 정보를 추출하고, HTML을 동적으로 생성하여 화면에 추가
					// data로 받은 리스트 안에 있는 각각의 객체를 'club' 이라는 변수로 사용
					data.forEach(function(club) {
						
						var clubId = club.id;
						var clubName = club.clubName;
						var host = club.host;
						var descript = club.descript;
						var formatCDate = club.formatCDate();
						var setupClubImage = club.setupClubImage();
						// index 페이지에서 principal 값을 JavaScript 변수에 할당
						var principal = "${principal}";
						
						// HTML 생성 / principal은 index 페이지뜰때 저장해놓으니까 이 html에 적용되겠지
			            var html = `
			                <div class="col-md-6 col-lg-4 col-xl-3">
			                    <a href="/club/view/${clubId}">
			                        <div class="rounded position-relative fruite-item">
			                            <div class="fruite-img">
			                                <img src="${setupClubImage}" class="img-fluid w-100 rounded-top" style="height: 380px;" alt="">
			                            </div>
			                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
			                                <h4>${clubName}</h4>
			                                <h6>${host}</h6>
			                                <p>${descript}</p>
			                                <div class="d-flex justify-content-between flex-lg-wrap">
			                                    <p class="text-dark fs-5 fw-bold mb-0" style="margin-top: 5%;">${formatCDate}</p>
			                                    <i data-id="${clubId}" data-principal="${principal}" name="wishButton" class="bi-heart" style="font-size: 50px; cursor: default;"></i>
			                                </div>
			                            </div>
			                        </div>
			                    </a>
			                </div>
			            `;
						
						// 생성한 HTML을 화면에 추가
						// id값 clubList 태그에 추가함
           				$('#clubList').append(html);
					})
					// 여기로 안들어옴!!!!!!!!!!!
					alert('성공3');
				},
				error : function() {
					alert('에러');
				}
			})
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
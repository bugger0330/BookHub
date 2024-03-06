const check = document.querySelector(".ft_sb_p"); // 출석체크 버튼
const checkDiv = document.querySelector(".check-go-btn-bg");
const li = document.querySelectorAll("li");
const exit = document.querySelector(".exit");

// 전송
check.onclick = () => {
    const checkToday = ulElement.querySelector('.today');
    const chOn = document.querySelectorAll('.ch_on');
    console.log('currentDay : '+currentDay);
    console.log('chOn '+chOn.length);
    // 중복 체크
    if(checkToday && checkToday.classList.contains('ch_on')){
		alert("이미 출석되었습니다.");
		return;
	}
	
	// 일주일 마감
	if(chOn.length >= 7) {
		alert("이번 달 출석체크는 끝나셨습니다.");
		return;
	}
    
    
    // 월, 현재 날짜
	fetch('/calendar/attendance',{
		method: "POST",
		headers: {
			"Content-Type": "application/json;charset=UTF-8",
		},
		body: JSON.stringify({
	        month: currentMonth,
	        today: currentDay,
    	}),
	}).then((response) => response.json())
	.then((data) => {
		const days = data.size;
		const point = data.point;
		
		console.log("days : "+days);
		console.log("point : "+point);
		
		// 현재 날짜 표시
		const currentDateElement = ulElement.querySelector('.today');
		if (currentDateElement) {
		    currentDateElement.classList.toggle('ch_on', true);
		}
		
		// 일수, 포인트 체크
		if(days != 7) {
			alert("출석되었습니다.");
		} else {
			alert(point+"를 적립 받았습니다!");
		}
		
	})
	.catch((error) => {
		alert('출석체크에 문제가 발생했습니다. 고객센터로 문의해주세요.');
		console.log(error);
	});

}

// 나가기
exit.addEventListener('click', function(e){
	if(confirm("오늘의 출석을 하지 않으시겠습니까?")){
		window.location.href = '/';
	}	
});

const check = document.querySelector(".ft_sb_p"); // 출석체크 버튼
const checkDiv = document.querySelector(".check-go-btn-bg");
const li = document.querySelectorAll("li");

check.onmouseover = () => {
    checkDiv.classList.add("check_go_btn_on");
    // checkDiv.style.background = "background: rgba(255, 255, 255, 0.1);";
} // 커서 갖다댔을때 백그라운드 이미지 바꾸는거 // 아직 구현 못함
check.onmouseout = () => {
    checkDiv.classList.remove("check_go_btn_on");
    // checkDiv.style.background = "background: rgba(255, 255, 255, 0.1);";
}

// 일수 전송
check.onclick = () => {
    alert("출석되었습니다.");
    
    // 월, 현재 날짜
	fetch('/calendar/attendance?today='+ currentDay,{
		method: "POST",
		headers: {
			"Content-Type": "application/json;charset=UTF-8",
		},
	}).then((response) => response.json())
	.then((data) => {
		const days = data.size;
		const point = data.point;
		
		console.log("days : "+days);
		console.log("point : "+point);
		
		alert(days+"일 출석되었습니다.");
		
		const currentDateElement = ulElement.querySelector('.today');
		if (currentDateElement) {
		    currentDateElement.classList.toggle('ch_on', true);
		}
	})
	.catch((error) => {
		alert('출석체크에 문제가 발생했습니다. 고객센터로 문의해주세요.');
		console.log(error);
	});

}

// 달력 클릭 체크
/* 
for(let i = 0; i < li.length; i++){
    li[i].onclick = () => {
        let liP = li[i].querySelector("p");
        if(li[i].className == "ch_on"){
            alert("이미 출석 되었습니다.");
        }else{
            li[i].classList.add("ch_on");
            liP.classList.add("ch_on_p");
            alert("출석되었습니다.");
        }
    }
}
*/
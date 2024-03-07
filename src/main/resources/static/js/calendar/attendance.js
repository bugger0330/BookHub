const ulElement = document.getElementById('calendar'); // 캘린더
const title = document.querySelector(".ft_sb"); // 현재 월
const li = document.querySelectorAll("li");

let currentMonth = 1;
let currentDay = 1;
let currentPoint = 1;

// 월, 현재 날짜
fetch('/calendar/month',{
	method: "GET",
	headers: {
		"Content-Type": "application/json;charset=UTF-8",
	},
})
.then((response) => response.json())
.then((data) => {
	
	const month = data.month;
	const days = data.today;
	let attendance = [];
	const point = data.point;
	
	// attendance null 체크
	if (data && data.attendance) {
	    attendance = data.attendance;
	}
	
    // 현재 날짜 월 넣기
    title.textContent = ''+month;
	

    // 저장
    currentMonth = month;
    currentDay = days;
    currentPoint = point;
    
    // 달력 출력
    dateCalculator(currentMonth, currentDay);
    
    // 태그 부여
    addClassTag(days, attendance);
    
})
.catch((error) => {
	alert('날짜를 확인할 수 없습니다. 고객센터에서 문의해주세요.');
});


// 날짜 계산기 예) 2월 -> 28일
function dateCalculator(currentMonth){
	
	 // 클래스 추가하여 날짜 출력
    for (let i = 1; i <= 31; i++) {
        let classAttribute = '';
        if (i % 7 === 0) {
            classAttribute = 'sevens';
        }

     	// 30일까지 있는 월과 2월 처리
        if (currentMonth == 2) {
        	if(i > 28) {
        		continue; // 2월은 28일까지만 있는 경우가 있으므로, 28일 이후의 날짜는 생략합니다.
        	}
        } else if ([4, 6, 9, 11].includes(currentMonth)) {
            if (i > 30) {
                continue; // 4월, 6월, 9월, 11월은 30일까지 있는 경우가 있으므로, 30일 이후의 날짜는 생략합니다.
            }
        }

        // li 요소 생성하여 ul에 추가
        const liElement = document.createElement('li');
        liElement.innerHTML = '<p>'+i+'</p>';
        if (classAttribute) {
            liElement.setAttribute('class', classAttribute.trim());
        }
        ulElement.appendChild(liElement);
    }
}

// 클래스 부여
function addClassTag(days, attendance) {
	// 클래스 부여 로직
    const lis = ulElement.getElementsByTagName('li');
    for(let li of lis) {
    	
    	// 오늘인 경우 today 클래스 추가
        if(li.textContent.trim() === days.toString()) {
            li.classList.add('today');
        }
        
     	// 출석된 날짜인 경우 ch_on 클래스 추가
	    if (attendance.includes(parseInt(li.textContent))) {
	        li.classList.toggle('ch_on', true);
	    }
    }
	
}

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookHub :: 독서와 무제한으로 친해지기</title>
    
     <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">
    
    <link rel="stylesheet" href="/css/calendar/event.css">
    <style>
    	.today > p {
    		color: #06BBCC;
    	}
        .sevens > p {
            color: red; /* 7의 배수인 날짜에 텍스트 색상 지정 */
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="div-main">
            <div class="check1">
                <img src="/img/calendar/ch_ic02.png" alt="" class="ch_ic02">
                <img src="/img/calendar/ch_ic03.png" alt="" class="ch_ic03">
                <img src="/img/calendar/ch_ic01.png" alt="" class="ch_ic01">
                <img src="/img/calendar/ch_ic04.png" alt="" class="ch_ic04">
                <img src="/img/calendar/ch_ic05.png" alt="" class="ch_ic05">
                <img src="/img/calendar/ch_ic06.png" alt="" class="ch_ic06">
                <img src="/img/calendar/ch_ic07.png" alt="" class="ch_ic07">
                <img src="/img/calendar/ch_ic08.png" alt="" class="ch_ic08">
                <img src="/img/calendar/ch_ic09.png" alt="" class="ch_ic09">
                <div class="month">
                    <div class="ch_month">
                        <h5 class="ft_sb">3
                            <span>月</span>
                        </h5>
                    </div>
                    <div class="ch_txt">
                        <img src="/img/calendar/ch_month_txt.png" alt="">
                    </div>
                </div>
                <div class="check_top">
                    <div class="check_top_inner">
                        <p class="pp">
                        	한 달 동안
                            <b>7일 출석체크</b>를 하면
                            <b style="margin-left:10px;">최대 700 포인트</b>
                            지급!</p>
                    </div>
                </div>
                <div class="check_stamp">
                    <ul id="calendar"></ul>
                </div>
                <div class="check_go_btn">
                    <div class="check-go-btn-bg"></div>
                    <img src="/img/calendar/twinkle.png" alt="" class="ani_tw">
                    <div class="click_btn">
                        <div class="click_div">
                            <img class="btn_img" src="/img/calendar/click_mouse.png" alt="">
                            <span class="ft_sb1">CLICK!</span>
                        </div>
                    </div>
                </div>
                <p class="ft_sb_p">출석체크하기 !!</p>
            </div>
        </div>
    </div>
    <script>
        // ul 요소 가져오기
        const ulElement = document.getElementById('calendar');
        const title = document.querySelector(".ft_sb");

        // 현재 날짜
        let currentMonth = 1;
        let currentDay = 1;
        
     	// 월, 현재 날짜
    	fetch('/calendar/month',{
    		method: "GET",
    		headers: {
    			"Content-Type": "application/json;charset=UTF-8",
    		},
    	})
     	.then((response) => response.json())
		.then((data) => {
		    currentMonth = data.month;
		    currentDay = data.today;
		    
		    title.textContent = ''+ data.currentMonth;
		    console.log(currentMonth+'월 '+currentDay+'일');
			
			 // 클래스 부여 로직
		    const lis = ulElement.getElementsByTagName('li');
		    for(let li of lis) {
		        if(li.textContent.trim() === currentDay.toString()) {
		            li.classList.add('today');
		        }
		    }
		})
    	.catch((error) => {
    		alert('날짜를 확인할 수 없습니다. 고객센터에서 문의해주세요.');
    		console.log(error);
    	});
        

        // 클래스 추가하여 날짜 출력
        for (let i = 1; i <= 31; i++) {
            let classAttribute = '';
            if (i % 7 === 0) {
                classAttribute = 'sevens';
            }

            // 30일까지 있는 월과 2월 처리
            if (currentMonth === 2 && i > 28) {
                continue; // 2월은 28일까지만 있는 경우가 있으므로, 28일 이후의 날짜는 생략합니다.
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
    </script>
    <script src="/js/calendar/event.js"></script>
</body>
</html>

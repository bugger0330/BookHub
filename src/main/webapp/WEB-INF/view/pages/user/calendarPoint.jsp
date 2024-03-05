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
    
    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
    	.today > p {
    		color: #06BBCC;
    	}
        .sevens > p {
            color: red; /* 7의 배수인 날짜에 텍스트 색상 지정 */
        }
        
        .div-explan {
        	display: flex;
		    width: 100%;
		    position: absolute;
		    bottom: 10px;
		    flex-direction: column;
		    align-items: center;
		    
        }
        .div-explan > p {
        	color: #52565b;
        	font-weight: bold;
        }
        
        .exit {
        	z-index: 1;
		    position: absolute;
		    width: 100px;
		    height: 100px;
		    top: 30px;
		    left: 30px;
        }
        .exit > img {
        	width: 100%;
    		height: 100%;
    		cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="container">
    	<div class="exit">
        	<img src="/img/calendar/x-lg.svg" alt=""/>
        </div>
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
                <div class="div-explan">
                	<p>※ 출석체크 포인트는 한 달에 1회만 획득 가능하며, 출석일수는 다음 달로 넘어가면 초기화됩니다.</p>
	            	<p>※ 출석체크 포인트 적립은 10, 50, 100, 350, 700으로 구성되어 있습니다.</p>
	            	<p>※ 임의로 출석체크 조작으로 인한 포인트 획득은 불법 행위이며, 이에 따른 법적 제재가 가해질 수 있습니다.</p>
	            </div>
            </div>
        </div>
    </div>
    <script>
        const ulElement = document.getElementById('calendar'); // 캘린더
        const title = document.querySelector(".ft_sb"); // 현재 월
		
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
			console.log(data);
			
			const month = data.month;
			const days = data.today;
			let attendance = [];
			
			// attendance null 체크
			if (data && data.attendance) {
			    attendance = data.attendance;
			}
			
			console.log(month+'월 '+days+'일');
		    console.log('출석 날짜 :'+attendance);
			
		    // 현재 날짜 월 넣기
		    title.textContent = ''+month;
			

		    // 저장
		    currentMonth = month;
		    currentDay = days;
		    
		    // 달력 출력
		    dateCalculator(currentMonth, currentDay);
		    
		    // 태그 부여
		    addClassTag(days, attendance);
		    
		})
    	.catch((error) => {
    		alert('날짜를 확인할 수 없습니다. 고객센터에서 문의해주세요.');
    		console.log(error);
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
    </script>
    <script src="/js/calendar/event.js"></script>
    
</body>
</html>

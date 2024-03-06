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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <script src="/js/principal.js"></script>
    <script>
	    const uid = memberId;
	    console.log(uid);
	
	    function loginDiv(uid) {
	        if (uid === null || uid === '') {
	        	alert('비회원은 사용할 수 없습니다.');
	            window.location.href = '/';
	        }
	    }
	
	    loginDiv(uid);
    </script>
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
    <script src="/js/calendar/attendance.js"></script>
    <script src="/js/calendar/event.js"></script>
    
</body>
</html>

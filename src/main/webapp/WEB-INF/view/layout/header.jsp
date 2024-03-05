
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BookHub :: 독서와 무제한으로 친해지기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    
    <!-- book custom css -->
    <link href="/css/book/bookList.css" rel="stylesheet">
    <link href="/css/book/bookDetail.css" rel="stylesheet">
    <link href="/css/book/bookSearch.css" rel="stylesheet">

    <!-- point custom css -->
    <link href="/css/point/cafe.css" rel="stylesheet">
    <link href="/css/point/print.css" rel="stylesheet">
    <link href="/css/point/computer.css" rel="stylesheet">
    <link href="/css/point/orderList.css" rel="stylesheet">
    
    <!-- book share custom css -->
    <link href="/css/share/write.css" rel="stylesheet">
    <link href="/css/share/read.css" rel="stylesheet">
    <link href="/css/share/detail.css" rel="stylesheet">
   
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/principal.js"></script>
    
</head>

<body>
    <!-- 로딩 스피너 시작 -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- 로딩 스피너 끝 -->


    <!-- 내비바 시작 -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="/" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <img src="/img/logo.png" style="width: 100%" height="100%">
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/" class="nav-item nav-link active">Home</a>
                 
                <a href="/about" class="nav-item nav-link">도서관 소개</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">도서</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/book/list-all" class="dropdown-item">리스트</a>
                        <a href="/book/search" class="dropdown-item">통합검색</a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">열린공간</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/notice/list" class="dropdown-item">공지사항</a>
                        <a href="/qna/list" class="dropdown-item">문의하기</a>
                        <a href="/faq/list" class="dropdown-item">자주 묻는 질문</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">독서활동</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/club/index" class="dropdown-item">독서모임</a>
                        <a href="/club/save" class="dropdown-item">모임 개설하기</a>
                        <a href="/club/saveList" class="dropdown-item">모임 개설내역</a>
                        <a href="/club/applicationList" class="dropdown-item">모임 신청내역</a>
                        <a href="/club/wishList" class="dropdown-item">찜</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">포인트</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/point/cafe" class="dropdown-item">카페</a>
                        <a href="/point/print" class="dropdown-item">프린트/복사</a>
                        <a href="/point/computer" class="dropdown-item">컴퓨터 사용</a>
                         <a href="/point-shop" class="dropdown-item">포인트 구매하기</a>
                        <a href="/point/order-list" class="dropdown-item">포인트 사용내역</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">책 공유</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/share/read" class="dropdown-item">리스트</a>
                        <a href="/share/write" class="dropdown-item">등록</a>
                    </div>
                </div>
                <!-- 이부분은 로그인 되었을 경우에만 표시되게 설정 -->
                <sec:authorize access="isAuthenticated()">
                  <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu fade-down m-0">
                    <a href="/user/mypage" class="dropdown-item">나의 정보</a>
                        <a href="team.html" class="dropdown-item">도서 찜목록</a>
                        <a href="testimonial.html" class="dropdown-item">회원정보수정</a>
                       <a href="testimonial.html" class="dropdown-item">회원탈퇴</a>
                    </div>
                </sec:authorize>
                    
                </div>
                <!-- 이부분은 관리자계정으로 로그인시 표시되게 설정해야함 -->
                <sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/admin" class="nav-item nav-link active">관리자 페이지</a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<div class="navbar-nav" style="
					    display: flex;
					    width: 170px;
					    text-align: center;
					    flex-direction: column;
					    justify-content: space-around;
					    color: #06BBCC;"
					><sec:authentication property="principal.user.name"/></div>
				</sec:authorize>
            </div>
            <!-- 이부분은 로그인하였을 경우 로그아웃 버튼으로, 로그인하지 않았을 경우 로그인/회원가입 버튼으로 -->
            <sec:authorize access="isAnonymous()">
           		<a href="/login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인/회원가입<i class="fa fa-arrow-right ms-3"></i></a>
           	</sec:authorize>
           	<sec:authorize access="isAuthenticated()">
			<a href="/logout" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
			</sec:authorize>
        </div>
    </nav>
    <!-- 내비바 끝 -->

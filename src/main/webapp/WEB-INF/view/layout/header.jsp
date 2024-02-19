<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BookHub :: 독서와 무제한으로 친해지기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <!-- CS CSS -->
    <link href="css/csStyle.css" rel="stylesheet"> 
    
    <!-- 네이버 스마트 에디터 2.0 -->
    <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    
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
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>Book Hub</h2>
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
                        <a href="/search" class="dropdown-item">도서통합검색</a>
                        <a href="/suggest" class="dropdown-item">추천도서</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">열린공간</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/notice" class="dropdown-item">공지사항</a>
                        <a href="/qna" class="dropdown-item">문의하기</a>
                        <a href="/faq" class="dropdown-item">자주 묻는 질문</a>
                       
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">독서활동</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="team.html" class="dropdown-item">모임 개설하기</a>
                        <a href="testimonial.html" class="dropdown-item">책 기부</a>
                    </div>
                </div>
                <!-- 이부분은 로그인 되었을 경우에만 표시되게 설정 -->
                  <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="team.html" class="dropdown-item">도서 찜목록</a>
                        <a href="testimonial.html" class="dropdown-item">회원정보수정</a>
                       <a href="testimonial.html" class="dropdown-item">회원탈퇴</a>
                    </div>
                    
                    
                </div>
                <!-- 이부분은 관리자계정으로 로그인시 표시되게 설정해야함 -->
              <a href="/admin" class="nav-item nav-link active">관리자 페이지</a>
            </div>
            <!-- 이부분은 로그인하였을 경우 로그아웃 버튼으로, 로그인하지 않았을 경우 로그인/회원가입 버튼으로 -->
            <a href="/login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인/회원가입<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- 내비바 끝 -->
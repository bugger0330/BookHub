<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BookHub 관리자페이지</title>
<!-- Favicon-->
<link rel="icon" type="/image/x-icon" href="/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/adminpagestyles.css" rel="stylesheet" />
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="/admin">BookHub 관리자페이지</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="/admin">관리자페이지 홈으로</a></li>
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="/">BookHub으로</a></li>
                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle"  id="navbarDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/user/list">회원조회</a></li>
                        </ul></li>
                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">광고</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/ad-setting">배너광고추가</a></li>
                            <li><a class="dropdown-item" href="/ad/list">배너광고목록</a></li>
                        </ul></li>

                </ul>
            </div>
        </div>
    </nav>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

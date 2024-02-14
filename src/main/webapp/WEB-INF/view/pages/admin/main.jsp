<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/adminStyles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- jQuery를 import 합니다 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/admin">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->

		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="/">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> BookHub으로 이동
						</a>
						<div class="sb-sidenav-menu-heading">회원관리</div>
						<a class="nav-link" id="menu-01">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 전체회원 조회
						</a>
						<div class="sb-sidenav-menu-heading">광고설정</div>
						<a class="nav-link" id="menu-02">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 배너광고 설정
						</a>


						<div class="sb-sidenav-menu-heading">결제관리</div>
						<a class="nav-link" id="menu-03">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 환불요청 목록
						</a> <a class="nav-link" id="menu-04">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 환불요청 승인
						</a>
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<!-- Ajax로 로드될 내용이 들어갈 부분 -->
			<div class="container-fluid px-4">
				<div class="alert alert-dark mt-3" role="alert">관리자페이지에 오신것을 환영합니다.</div>
				
				

			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<script>
		$(document).ready(function() {
			// 회원관리 버튼 클릭 시
			$("#menu-01").click(function(event) {
				event.preventDefault(); // 기본 동작 방지

				// Ajax 요청
				$.ajax({
					url : "/customer", // 요청을 보낼 서버의 엔드포인트 URL
					type : "GET", // 요청 메소드 (GET, POST 등)
					dataType : "html", // 응답 데이터 타입 (HTML, JSON 등)
					success : function(response) {
						// 성공적으로 응답을 받았을 때 실행할 코드
						$("#layoutSidenav_content").html(response); // 응답을 해당 요소에 출력
					},
					error : function(xhr, status, error) {
						// 요청이 실패했을 때 실행할 코드
						console.error("Ajax 요청 실패: " + status + ", " + error);
					}
				});
			});

			// 배너관리 버튼 클릭 시
			$("#menu-02").click(function(event) {
				event.preventDefault(); // 기본 동작 방지

				// Ajax 요청
				$.ajax({
					url : "/ad-setting", // 요청을 보낼 서버의 엔드포인트 URL
					type : "GET", // 요청 메소드 (GET, POST 등)
					dataType : "html", // 응답 데이터 타입 (HTML, JSON 등)
					success : function(response) {
						// 성공적으로 응답을 받았을 때 실행할 코드
						$("#layoutSidenav_content").html(response); // 응답을 해당 요소에 출력
					},
					error : function(xhr, status, error) {
						// 요청이 실패했을 때 실행할 코드
						console.error("Ajax 요청 실패: " + status + ", " + error);
					}
				});
			});

			// 환불요청목록 버튼 클릭 시
			$("#menu-03").click(function(event) {
				event.preventDefault(); // 기본 동작 방지

				// Ajax 요청
				$.ajax({
					url : "/refund-list", // 요청을 보낼 서버의 엔드포인트 URL
					type : "GET", // 요청 메소드 (GET, POST 등)
					dataType : "html", // 응답 데이터 타입 (HTML, JSON 등)
					success : function(response) {
						// 성공적으로 응답을 받았을 때 실행할 코드
						$("#layoutSidenav_content").html(response); // 응답을 해당 요소에 출력
					},
					error : function(xhr, status, error) {
						// 요청이 실패했을 때 실행할 코드
						console.error("Ajax 요청 실패: " + status + ", " + error);
					}
				});
			});

			// 환불요청승인 버튼 클릭 시
			$("#menu-04").click(function(event) {
				event.preventDefault(); // 기본 동작 방지

				// Ajax 요청
				$.ajax({
					url : "/refund-request", // 요청을 보낼 서버의 엔드포인트 URL
					type : "GET", // 요청 메소드 (GET, POST 등)
					dataType : "html", // 응답 데이터 타입 (HTML, JSON 등)
					success : function(response) {
						// 성공적으로 응답을 받았을 때 실행할 코드
						$("#layoutSidenav_content").html(response); // 응답을 해당 요소에 출력
					},
					error : function(xhr, status, error) {
						// 요청이 실패했을 때 실행할 코드
						console.error("Ajax 요청 실패: " + status + ", " + error);
					}
				});
			});
		});
	</script>
</body>
</html>

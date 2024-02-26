<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">문의하기</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="csMainContainer">

		<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>

		<div class="container">

			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">문의하기</li>
				</ol>
			</nav>

			<div class="container border">
				<br>
				<div>
					<input type="text" readonly/>
				</div>
				<br>
				<div>
					<textarea readonly></textarea>
				</div>

				<br>
				<div>
					포스트 번호 : <span id="id"><i></i></span><br> 작성자 : <span><i></i></span>
				</div>

				<hr>
				<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
					<button class="btn btn-warning">수정하기</button>
					<button id="btn-delete" class="btn btn-danger">삭제하기</button>
				<br>
				<br>


			</div>


		</div>
	</div>
</section>



<script src="/js/csViewScript.js">
	
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



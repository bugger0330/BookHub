<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">공지사항</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="csMainContainer">

		<%-- <%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%> --%>

		<div class="container">

			<div class="container mt-3">

				<h2>공지사항 상세보기</h2>
				<div class="mb-3">
					<label for="title">Title:</label> <span id="title-display"></span>
				</div>
				<div class="mb-3">
					<label for="content">Content:</label> <span id="content-display"></span>
				</div>
				<div class="mb-3">
					<label for="filepath">File :</label> <span id="file-display"></span>
				</div>
			</div>

			<div>
				<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
			</div>


		</div>


	</div>
	</div>
</section>

<script src="/js/cs/csNotice.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



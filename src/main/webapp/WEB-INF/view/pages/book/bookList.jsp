<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">도서 목록</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	<div class="book--list--main--div">
		<div class="book--list--inner--box"></div>
		<div class="page--box">
			<span class="page--bar--btn">◀</span>
			<div class="page--num--box"></div>
			<span class="page--bar--btn">▶</span>
		</div>
	</div>
	
	<script src="/js/book/bookList.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

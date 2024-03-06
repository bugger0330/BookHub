<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">Coffie & Bakery</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
    <div class="share--main-div">
        <div class="share--header">
            <span>공유 도서 목록</span>
        </div>
        <div class="share--body">
            <div class="share--book-list-box"></div>
        </div>
    </div>
<script src="/js/share/read.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

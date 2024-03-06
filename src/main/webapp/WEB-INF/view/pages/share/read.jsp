<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">공유 도서 목록</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
    <div class="share1--main-div">
        <div class="share1--body--read">
            <div class="share1--book-list-box"></div>
        </div>
    </div>
<script src="/js/share/read.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

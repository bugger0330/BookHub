<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">도서 통합검색</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	<div class="book--search--main--div">
        <div class="book--search--box">
            <select class="book--search--select">
                <option value="bookName">제목</option>
                <option value="writer">저자</option>
                <option value="company">출판사</option>
            </select>
            <input type="text" class="book--search--select--input">
            <button type="button" class="book--search--search--btn">검색</button>
        </div>
        <div class="book--search--nothing">
        	<h1 class="book--search--nothing--text"></h1>
        </div>
        <div class="book--search--inner--box"></div>
    </div>
<script src="/js/book/bookSearch.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

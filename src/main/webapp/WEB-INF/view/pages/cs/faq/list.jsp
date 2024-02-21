<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- <script>
	$(function() {
		$('.more').click(function(e) {
			e.preventDefault();

			$(this).parents('.faqBlock').find('> li').show();
			$(this).hide();
		});
		$('.simple').click(function(e) {
			e.preventDefault();

			// 모든 li 요소를 숨기고
			$(this).parent().find('> li').hide();
			// 처음 3개 li 요소를 다시 보이게 하고
			$(this).parent().find('> .faqItem:nth-child(1)').show();
			$(this).parent().find('> .faqItem:nth-child(2)').show();
			$(this).parent().find('> .faqItem:nth-child(3)').show();
			// "더 보기" 버튼을 표시
			$(this).parent().find('> .more').show();

		});
	});
</script> -->

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">자주 묻는 질문</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="qnaMainContainer">

		<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>

		<div class="container">

			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">자주 묻는 질문</li>
				</ol>
			</nav>

			<div>
				<h2>자주 묻는 질문</h2>

				<div>


					<ul class="list-group">
						<%-- <c:forEach> --%>
						<li class="list-group-item active" aria-current="true">
						<a>1.
						<span>Q.</span>제목
						</a>
						</li>
						<%-- </c:forEach> --%>
						
						<li class="list-group-more" id="showMore">더보기</li>
						<li class="list-group-simple" id="showLess">간단히 보기</li>
					</ul>
				</div>

				<ul class="qna pagination"
					style="display: flex; justify-content: center; align-content: center;">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



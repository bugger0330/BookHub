<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/js/csScript.js"></script>
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
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">자주 묻는 질문</li>
				</ol>
			</nav>

			<div>
				<h2>자주 묻는 질문</h2>

				<button id="btn-all-close">FAQ ALL Close</button>
				<br>
				<table
					class="table table-hover">
					<thead class="thead-light text-center">
						<tr>
							<th>No</th>
							<th>FAQ Title</th>
							<th>Category</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody class="text-center">
					<c:forEach var="list" items="${faqList}">
						<tr>
							<td>${list.id}</td>
							<td class="text-left" width="50%">
								<div class="panel-faq-container">
									<p class="panel-faq-title">${list.title}</p>
									<div class="panel-faq-answer">
										<p>${list.content}</p>
									</div>
								</div>
							</td>
							<td>${list.cate2}</td>
							<td>${list.rdate}</td>
						</tr>
						</c:forEach>
						<tr class="info">
							<td colspan=3 class="text-left">자주 묻는 질문 총 합계</td>
							<td>429</td>
						</tr>
					</tbody>
				</table>

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



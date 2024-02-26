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
				style="--bs-breadcrumb-divider: url(&amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;#34;);"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">문의하기</li>
				</ol>
			</nav>

			<div>
				<h2>문의하기</h2>
				<div class="input-group" style="margin-bottom: 7px">
					<select name="searchType">
						<option value="prodName">전체</option>
						<option value="prodNo">제목+내용</option>
						<option value="company">작성자</option>
					</select>
					<div class="form-outline">
						<input type="search" id="form1" class="form-control"
							placeholder="Search" />
					</div>
					<button type="button" class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<div class="btn-group" role="group"
					aria-label="Basic outlined example" style="display: flex;">
					<button type="button" class="btn btn-outline-primary"
						style="flex: none;">등록</button>
					<button type="button" class="btn btn-outline-primary"
						style="flex: none;">나의 문의내역</button>
					<button type="button" class="btn btn-outline-primary"
						style="flex: none;">전체 문의내역</button>
				</div>
			</div>
			<table class="table table-hover">
				<thead class="thead-light text-center">
					<tr>
						<th>No</th>
						<th>Q&A Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Answer</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:forEach var="list" items="${qnaList}">
						<tr  class="page-click" id="${list.id}">
							<td>${list.id}</td>
							<td class="text-left" width="50%">
								<div class="panel-cs-container">
									<p class="panel-cs-title">${list.title}</p>
								</div>
							</td>
							<td>${list.writer}</td>
							<!-- 작성자 마킹처리 -->
							<td>${list.rdate}</td>

							<c:if test="${list.answerComplete eq 1}">
								<td>답변완료</td>
							</c:if>
							<c:if test="${list.answerComplete eq 0}">
								<td>미답변</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="qna pagination">
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

<script src="/js/csPostScript.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



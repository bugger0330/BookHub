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

	<div class="qnaMainContainer">

		<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>

		<div class="container">

			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;#34;);"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">공지사항</li>
				</ol>
			</nav>

			<div>
				<h2>공지사항</h2>
				<div class="input-group" style="margin-top: 30px;">
					<select name="searchType">
						<option value="prodName">전체</option>
						<option value="prodNo">제목+내용</option>
						<option value="company">작성일</option>
					</select>
					<div class="form-outline">
						<input type="search" id="form1" class="form-control"
							placeholder="Search" />
					</div>

					<button type="button" class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<table class="table table-hover"
				style="margin-top: 30px; margin-bottom: 30px;">
				<thead class="thead-light text-center">
					<tr>
						<th>No</th>
						<th>NOTICE Title</th>
						<th>File</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<!-- 가장 조회수가 높은 게시글 상위 노출 -->
					<tr>
						<td><i class="bi bi-megaphone-fill text-danger"></i></td>
						<td>설날 중앙도서관 휴관 안내</td>
						<td><i class="bi bi-file-earmark-text-fill"></i></td>
						<td>관리자</td>
						<td>2024-02-01</td>
						<td>144</td>
					</tr>
					<c:forEach var="list" items="${noticeList}">
						<tr>
							<td>${list.id}</td>
							<td>${list.title}</td>
							<td><i class="bi bi-file-earmark-text-fill">${list.ofile}</i></td>
							<td>${list.writer}</td>
							<td>${list.rdate}</td>
							<td>${list.hit}</td>
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
</section>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



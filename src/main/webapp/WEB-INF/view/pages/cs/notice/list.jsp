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

		<div class="container">

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
					</tr>
				</thead>
				<tbody class="text-center">
					
					<c:forEach var="list" items="${noticeList}">
						<tr class="page-click" id="${list.id}">
							<td><i class="bi bi-megaphone-fill text-danger">${list.id}</i></td>
							<td class="text-left" width="50%">
								<div class="panel-cs-container">
									<p class="panel-cs-title">${list.title}</p>
								</div>
							</td>
							<td><i class="bi bi-file-earmark-text-fill">${list.filepath}</i></td>
							<td>${list.writer}</td>
							<td>${list.rdate}</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>

			<!-- 페이징 처리 -->
			<div class="qna pagination">
				<c:if test="${page > 1}">
					<li class="page-item"><a href="?page=1&size=${size}"
						class="page-link">&laquo; 첫 페이지</a></li>
					<li class="page-item"><a href="?page=${page - 1}&size=${size}"
						class="page-link">&laquo; Prev</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<li class="page-item active"><a
								href="?page=${i}&size=${size}" class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="?page=${i}&size=${size}"
								class="page-link">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page < totalPages}">
					<li class="page-item"><a href="?page=${page + 1}&size=${size}"
						class="page-link">Next &raquo;</a></li>
					<li class="page-item"><a
						href="?page=${totalPages}&size=${size}" class="page-link">마지막
							페이지 &raquo;</a></li>
				</c:if>
			</div>

		</div>
	</div>
</section>

<script src="/js/cs/csNotice.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



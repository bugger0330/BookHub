<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>포인트상품 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<style>
table {
	border-collapse: collapse;
	width: 100%;
	border-radius: 20px;
	overflow: hidden;
}

th, td {
	border: 1px solid #dddddd;
	padding: 8px;
}

th {
	background-color: #007bff;
	color: white;
}

.pagination {
	margin-top: 20px;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #007bff;
	color: white;
	border: 1px solid #007bff;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<div class="container-fluid bg-dark py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">포인트상품 목록</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container-xxl">
		<div class="row justify-content-end mb-3">
			<div class="col-auto">
				<a href="/point-product-add" class="btn btn-dark">상품 추가하기</a>
			</div>
		</div>

		<c:choose>
			<c:when test="${not empty productList}">
				<table class="table table-hover table-light">
					<thead class="table-dark">
						<tr class="text-center">
							<th>No</th>
							<th>상품명</th>
						
							<th>포인트</th>
							<th>상품이미지</th>
							<th>판매여부</th>
							<th>setting</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ppd" items="${productList}">
							<tr>
								<td class="text-center align-middle">${ppd.id}</td>
								<td class="text-center align-middle">${ppd.prodName}</td>
								<td class="text-center align-middle"
									style="word-wrap: break-word; max-width: 100px;">${ppd.formatPoint()}</td>
															<td class="text-center align-middle" style="width: 300px"><img
									src="${ppd.setupPointProductImage()}" width="80%" height="80%"></td>
								<td class="text-center align-middle"><select
									class="form-select" id="postYn-${ppd.id}"
									onchange="updatePostStatus(${ppd.id})">
										<option value="Y" ${ppd.postYn == 'Y' ? 'selected' : ''}>판매중</option>
										<option value="N" ${ppd.postYn == 'N' ? 'selected' : ''}>판매중단</option>
								</select></td>
								<td class="text-center align-middle"><a
									href="/point-product/update/${ppd.id}" class="btn btn-primary">수정하기</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 처리 -->
				<div class="pagination justify-content-center mb-5">
					<c:if test="${page > 1}">
						<a href="?page=1&size=${size}">&laquo; 첫 페이지</a>
						<a href="?page=${page - 1}&size=${size}">&laquo; 이전</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i eq page}">
								<a href="?page=${i}&size=${size}" class="active">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}&size=${size}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page < totalPages}">
						<a href="?page=${page + 1}&size=${size}">다음 &raquo;</a>
						<a href="?page=${totalPages}&size=${size}">마지막 페이지 &raquo;</a>
					</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container wow fadeInUp">
					<p class="text-center">등록된 제품이 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>


	</div>
	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>

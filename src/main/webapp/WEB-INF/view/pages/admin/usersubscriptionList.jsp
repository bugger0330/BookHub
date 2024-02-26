<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>

<style>
table {
	border-collapse: collapse;
	width: 100%;
	border-radius: 20px; /* 테이블 모서리를 둥글게 만듭니다. */
	overflow: hidden; /* 테이블 내용이 모서리를 넘어가지 않도록 설정합니다. */
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #007bff; /* 테이블 헤더 배경색을 변경합니다. */
	color: white; /* 테이블 헤더 텍스트 색상을 변경합니다. */
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

.search {
	position: relative;
	width: 300px;
}

input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

img {
	position: absolute;
	width: 17px;
	top: 10px;
	right: 12px;
	margin: 0;
}
</style>
<link href="/css/adminpagestyles.css" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- Header Start -->
	<div class="container-fluid bg-dark py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">유저상품 전체조회</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container-xxl">





		<c:choose>
			<c:when test="${not empty userSubscriptionList}">
				<table class="table table-hover table-light">

					<thead class="table-dark">
						<tr class="text-center">
							<th>순서</th>
							<th>유저ID</th>
							<th>상품명</th>
							<th style="width: 100px">가격</th>
							<th>구매일</th>
							<th>구독 기간</th>
							<th>구독 시작일</th>
							<th>구독 종료일</th>
							<th>환불요청여부</th>
							<th>SETTING</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${userSubscriptionList}">
							<tr>
								<td class="text-center align-middle">${list.id}</td>
								<td class="text-center align-middle">${list.userId}</td>
								<td class="text-center align-middle">${list.prodName}</td>
								<td class="text-center align-middle">${list.price}원</td>
								<td class="text-center align-middle">${list.getPurchaseDateStr()}</td>
								<td class="text-center align-middle">${list.period}일</td>
								<td class="text-center align-middle">${list.getStartDateStr()}</td>
								<td class="text-center align-middle">${list.getEndDateStr()}</td>
								<td class="text-center align-middle">${list.refundYn}</td>
                                <td class="text-center align-middle"><a href="/sc-product/update/${product.spId}"><button type="button"
                                										class="btn btn-warning">자세히보기</button></a></td>

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
				<p>상품이 없습니다. 상품을 추가해주세요</p>
			</c:otherwise>
		</c:choose>
	</div>
<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap Bundle JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	<script>
	    $(document).ready(function(){
	        $('.dropdown-toggle').dropdown();
	    });
	</script>
</body>
</html>

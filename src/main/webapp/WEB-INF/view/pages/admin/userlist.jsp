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
					<h3 class="display-5 text-white animated slideInDown">회원조회</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="search mb-3">
			<form action="/user/list" method="get">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="유저 이름 검색"
						name="name">
					<div class="input-group-append">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>
			</form>
		</div>

		<c:choose>
			<c:when test="${not empty userList}">
				<table class="table table-hover table-light">
					<thead class="table-dark">
						<tr class="text-center">
							<th>순서</th>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>Email</th>
							<th>연락처</th>
							<th>계정유형</th>
							<th>보유포인트</th>
							<th>SETTING</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr>
							 
								<td class="text-center">${user.id}</td>
								<td class="text-center">${user.username}</td>
								<td class="text-center">${user.name}</td>
								<td class="text-center">${user.gender == 1 ? '남성' : '여성'}</td>
								<!-- 성별을 한글로 표시합니다. -->
								<td class="text-center">${user.email}</td>
								<td class="text-center">${user.phone}</td>
								<td class="text-center">${user.type == 1 ? '일반계정' : '관리자'}</td>
								<!-- 계정 유형을 한글로 표시합니다. -->
								<td class="text-center">${user.point}</td>
								<td class="text-center"><a href="/user/detail/${user.id}"><button type="button"
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
				<p>아직 생성된 유저가 없습니다.</p>
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

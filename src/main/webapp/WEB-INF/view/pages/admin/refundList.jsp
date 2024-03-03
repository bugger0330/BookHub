<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>환불요청</title>
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
					<h3 class="display-5 text-white animated slideInDown">환불요청 목록</h3>
				</div>
			</div>
		</div>
	</div>
	
	

	<div class="container-xxl">
	

		<c:choose>
			<c:when test="${not empty list}">
		
				<table class="table table-hover table-light">
					<thead class="table-dark">
						<tr class="text-center">
							<th>No</th>
							<th>유저명</th>
							<th>상품명</th>
							<th>포인트</th>
							<th>가격</th>
							<th>구매일자</th>
							<th>impUid</th>
							<th>merchantUid</th>
							<th>setting</th>
						
						</tr>
					</thead>
					<tbody>
				<c:forEach var="item" items="${list}">
    <tr>
        <td class="text-center align-middle">${item.id}</td>
        <td class="text-center align-middle">${item.userId}</td>
        <td class="text-center align-middle">${item.pointName}</td>
        <td class="text-center align-middle">${item.formatBalancePoint()}</td>
        <td class="text-center align-middle">${item.formatBalancePrice()}</td>
        <td class="text-center align-middle">${item.formatDateTime()}</td>
        <td class="text-center align-middle">${item.impUid}</td>
        <td class="text-center align-middle">${item.merchantUid}</td>
        <td class="text-center align-middle">
            <button class="btn btn-primary refund-btn" 
                    data-impuid="${item.impUid}" 
                    data-price="${item.price}" data-point="${item.point}" data-username="${item.userId}" data-id="${item.id}">환불하기</button>
        </td>
    </tr>
</c:forEach>
					</tbody>
				</table>
	
			</c:when>
			<c:otherwise>
				<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <div class="alert alert-info" role="alert">
                <strong>환불 요청 목록이 없습니다.</strong>
            </div>
        </div>
    </div>
</div>

			</c:otherwise>
		</c:choose>


	</div>
	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
		
	<script src="/js/admin/refund.js"></script>

	
</body>
</html>

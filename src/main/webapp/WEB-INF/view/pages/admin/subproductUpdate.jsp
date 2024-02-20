<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>광고 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card-header {
	background-color: #343a40;
	color: white;
}

.btn-submit {
	width: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-dark text-white">광고 정보 수정</div>
					<div class="card-body">
						<form action="/sub-product/edit/${product.spId}" id="edit-btn" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="spId" value="${product.spId}" />

							<div class="form-group">
								<label for="username">상품명</label> <input type="text"
									class="form-control" id="prodName" name="prodName" 
									value="${product.prodName}" required>
								<div id="titleFeedback" class="invalid-feedback"></div>
							</div>

							<div class="form-group">
								<label for="content">가격</label> <input type="text"
									class="form-control" id="price" name="price"
									value="${product.price}" required>
							</div>
							<div class="form-group">
								<label for="name">기간</label> <input type="text"
									class="form-control" id="period" name="period"
									value="${product.period}" required>
							</div>
							


							<button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


						<form id="delete-btn" action="/sub-product/delete/${product.spId}"
							method="post">
							<input type="hidden" name="_method" value="delete" />
							<button type="submit" class="btn btn-danger btn-submit">상품삭제</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

	

</body>


</html>

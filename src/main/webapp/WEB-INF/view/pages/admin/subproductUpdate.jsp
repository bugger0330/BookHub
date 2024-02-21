<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	<!-- Header Start -->
	<div class="container-fluid bg-dark py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">구독상품 수정</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-dark text-white">상품 정보 수정</div>
					<div class="card-body">
						<form action="/sc-product/edit/${product.spId}" id="edit-btn"
							method="post">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="spId" value="${product.spId}" />



							<div class="form-group">
								<label for="name">상품이름</label> <input type="text"
									class="form-control" id="prodName" name="prodName"
									value="${product.prodName}" required>
							</div>

							<div class="form-group">
								<label for="name">가격</label> <input type="text"
									class="form-control" id="price" name="price"
									value="${product.price}" required>
							</div>

							<div class="form-group">
								<label for="name">기간</label> <input type="text"
									class="form-control" id="period" name="period"
									value="${product.period}" required>
							</div>



							<div class="form-group"></div>


							<button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


						<form id="delete-btn" action="/sc-product/delete/${product.spId}"
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

	<script>
		$(document).ready(function() {
			// 수정 버튼 클릭 시 확인 창 띄우기
			$('#edit-btn').submit(function() {
				// 입력 필드의 값이 숫자로만 이루어져 있는지 확인
				var valid = true;
				$('#price, #period').each(function() {
					var input = $(this).val();
					if (!/^\d*$/.test(input)) {
						valid = false;
						return false; // 유효하지 않은 값이 하나라도 있으면 루프 종료
					}
				});

				// 모든 입력 필드가 유효한 경우에만 확인 창 띄우기
				if (valid) {
					return confirm('상품을 수정하시겠습니까?');
				} else {
					alert('금액과 기간에는 숫자만 입력하세요.');
					return false; // 확인 창 띄우지 않고 폼 제출 취소
				}
			});
		});

		// 삭제 버튼 클릭 시 확인 창 띄우기
		$('#delete-btn').submit(function() {
			return confirm('상품을 삭제하시겠습니까?');
		});
	</script>



</body>


</html>


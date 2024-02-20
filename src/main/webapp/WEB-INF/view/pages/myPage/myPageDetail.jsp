<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card-header {
	padding: 1rem;
}

.card-body {
	padding: 1rem;
}

.list-group-item {
	padding: 0.75rem 1.25rem;
}
</style>
</head>
<body>


	<!-- Header Start -->
	<div class="container-fluid bg-dark py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">마이페이지</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-dark text-white">회원 정보</div>
					<div class="card-body">
						<table class="table table-bordered">
							<tbody>

								<tr>
									<th scope="row" class="bg-light">아이디</th>
									<td>${user.username}</td>
								</tr>
								<tr>
									<th scope="row" class="bg-light">이름</th>
									<td>${user.name}</td>
								</tr>
								<tr>
									<th scope="row" class="bg-light">성별</th>
									<td>${user.gender == 1 ? '남성' : '여성'}</td>
								</tr>
								<tr>
									<th scope="row" class="bg-light">이메일</th>
									<td>${user.email}</td>
								</tr>
								<tr>
									<th scope="row" class="bg-light">연락처</th>
									<td>${user.phone}</td>
								</tr>



							</tbody>
						</table>
						<div class="text-center">
							<a href="/myPage/update/${user.id}">
								<button type="button" class="btn btn-outline-success me-3">회원수정</button>
							</a>


						</div>

					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		let obj = "${user}";
		console.log(obj);
	</script>


</body>
</html>
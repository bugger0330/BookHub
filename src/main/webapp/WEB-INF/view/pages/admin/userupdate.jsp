<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
</head>
<body>

	<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-dark text-white">회원 정보 수정</div>
					<div class="card-body">
						<form action="/user/edit/${user.id}" method="post">
							<input type="hidden" name="_method" value="put"/> <input
								type="hidden" name="id" value="${user.id}"/>

							<div class="form-group">
								<label for="username">아이디</label> <input type="text"
									class="form-control" id="username" name="username"
									value="${user.username}" required>
							</div>
							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name" value="${user.name}"
									required>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password"
									value="${user.password}" required>
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="email"
									value="${user.email}" required>
							</div>
							<div class="form-group">
								<label for="phone">연락처</label> <input type="text"
									class="form-control" id="phone" name="phone"
									value="${user.phone}" required>
							</div>
							<div class="form-group">
								<label for="zip">우편번호</label> <input type="text"
									class="form-control" id="zip" name="zip" value="${user.zip}"
									required>
							</div>
							<div class="form-group">
								<label for="addr1">주소</label> <input type="text"
									class="form-control" id="addr1" name="addr1"
									value="${user.addr1}" required>
							</div>
							<button type="submit" class="btn btn-primary btn-submit">수정하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

</body>
</html>

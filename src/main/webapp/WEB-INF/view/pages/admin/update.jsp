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

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-dark text-white">회원 정보 수정</div>
					<div class="card-body">
						<form action="/user/edit/${user.id}" id="edit-btn" method="post">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="id" value="${user.id}" />



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
								<label>성별</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="male" value="1"
										<c:if test="${user.gender == 1}">checked</c:if>> <label
										class="form-check-label" for="male">남성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="female" value="2"
										<c:if test="${user.gender == 2}">checked</c:if>> <label
										class="form-check-label" for="female">여성</label>
								</div>
							</div>

							<div class="form-group">
								<label>계정유형</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="role"
										id="user" value="USER"
										<c:if test="${user.role == 'USER'}">checked</c:if>> <label
										class="form-check-label" for="USER">일반유저계정</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="role"
										id="admin" value="ADMIN"
										<c:if test="${user.role == 'ADMIN'}">checked</c:if>> <label
										class="form-check-label" for="ADMIN">관리자계정</label>
								</div>
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
								<div id="phoneFeedback" class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<button id="find-address-btn" type="button"
									class="btn btn-primary">주소찾기</button>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="zip">우편번호</label> <input type="text"
										class="form-control" id="zip" name="zip" value="${user.zip}"
										required>
									<div id="zipFeedback" class="invalid-feedback"></div>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="addr1">주소</label> <input type="text"
										class="form-control" id="addr1" name="addr1"
										value="${user.addr1}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="addr2">상세주소</label> <input type="text"
										class="form-control" id="addr2" name="addr2"
										value="${user.addr2}" required>
								</div>
							</div>



							<div class="form-group"></div>


							<button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


						<form id="delete-btn" action="/user/delete/${user.id}"
							method="post">
							<input type="hidden" name="_method" value="delete" />
							<button type="submit" class="btn btn-danger btn-submit">회원삭제</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
	<script src="/js/admin/userUpdate.js"></script>



</body>


</html>

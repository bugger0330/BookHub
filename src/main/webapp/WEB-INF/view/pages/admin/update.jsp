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
						<form action="/user/edit/${user.id}"  id="edit-btn" method="post">
							<input type="hidden" name="_method" value="put"/> <input
								type="hidden" name="id" value="${user.id}"/>

							<div class="form-group">
                                <label for="username">아이디</label>
                                <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
                                <div id="usernameFeedback" class="invalid-feedback"></div>
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
                                <label>성별</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="1" <c:if test="${user.gender == 1}">checked</c:if>>
                                    <label class="form-check-label" for="male">남성</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="2" <c:if test="${user.gender == 2}">checked</c:if>>
                                    <label class="form-check-label" for="female">여성</label>
                                </div>
                            </div>

                            <div class="form-group">
                                                            <label>계정유형</label><br>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="type" id="user" value="1" <c:if test="${user.type == 1}">checked</c:if>>
                                                                <label class="form-check-label" for="user">일반유저계정</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="type" id="admin" value="9" <c:if test="${user.type == 9}">checked</c:if>>
                                                                <label class="form-check-label" for="admin">관리자계정</label>
                                                            </div>
                                                        </div>

							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="email"
									value="${user.email}" required>
							</div>
							<div class="form-group">
                                <label for="phone">연락처</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
                                <div id="phoneFeedback" class="invalid-feedback"></div>
                            </div>
                            <div class="form-group">
                                <label for="zip">우편번호</label>
                                <input type="text" class="form-control" id="zip" name="zip" value="${user.zip}" required>
                                <div id="zipFeedback" class="invalid-feedback"></div>
                            </div>

							<div class="form-group">
								<label for="addr1">주소</label> <input type="text"
									class="form-control" id="addr1" name="addr1"
									value="${user.addr1}" required>
							</div>


 <button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


                        <form id="delete-btn" action="/user/delete/${user.id}" method="post">
                            <input type="hidden" name="_method" value="delete"/>
                            <button type="submit" class="btn btn-danger btn-submit">회원삭제</button>
                        </form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

<script>
$(document).ready(function() {
    $('#edit-btn').submit(function(event) {
        if (!validateForm()) {
            event.preventDefault(); // 양식 제출 방지
        } else {
            // 수정하시겠습니까? 얼럿 창 표시
            if (!confirm('수정하시겠습니까?')) {
                event.preventDefault(); // 양식 제출 방지
            }
        }
    });

    $('#delete-btn').submit(function(event) {
        if (!confirm('정말로 삭제하시겠습니까?')) {
            event.preventDefault(); // 양식 제출 방지
        }
    });

    $('#edit-btn').on('click', function() {
        $('.alert').alert('close'); // 이전에 표시된 얼럿 창 숨기기
    });

    function validateForm() {
        var isValid = true;

        // 아이디 유효성 검사
        var usernameInput = $('#username').val();
        var koreanRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        if (koreanRegex.test(usernameInput)) {
            $('#username').addClass('is-invalid');
            $('#usernameFeedback').text('한글은 입력할 수 없습니다.');
            isValid = false;
        } else {
            $('#username').removeClass('is-invalid');
            $('#usernameFeedback').text('');
        }

        // 연락처 유효성 검사
        var phoneInput = $('#phone').val();
        var phoneRegex = /^[0-9]*$/;
        if (!phoneRegex.test(phoneInput)) {
            $('#phone').addClass('is-invalid');
            $('#phoneFeedback').text('숫자만 입력 가능합니다.');
            isValid = false;
        } else {
            $('#phone').removeClass('is-invalid');
            $('#phoneFeedback').text('');
        }

        // 우편번호 유효성 검사
        var zipInput = $('#zip').val();
        if (!phoneRegex.test(zipInput)) {
            $('#zip').addClass('is-invalid');
            $('#zipFeedback').text('숫자만 입력 가능합니다.');
            isValid = false;
        } else {
            $('#zip').removeClass('is-invalid');
            $('#zipFeedback').text('');
        }

        // 얼럿 창 표시
        if (!isValid) {
            alert('양식을 올바르게 입력해주세요.');
        }

        return isValid;
    }
});

</script>

</body>


</html>


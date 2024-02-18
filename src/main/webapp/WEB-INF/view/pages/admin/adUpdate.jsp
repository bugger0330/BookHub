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
						<form action="/ad/edit/${banner.id}"  id="edit-btn" method="post">
							<input type="hidden" name="_method" value="put"/> <input
								type="hidden" name="id" value="${banner.id}"/>

							<div class="form-group">
                                <label for="username">제목</label>
                                <input type="text" class="form-control" id="title" name="title" value="${banner.title}" required>
                                <div id="titleFeedback" class="invalid-feedback"></div>
                            </div>

							<div class="form-group">
								<label for="name">내용(url)</label> <input type="text"
									class="form-control" id="content" name="content" value="${banner.content}"
									required>
							</div>
							<div class="form-group">
                            								<label for="name">광고주</label> <input type="text"
                            									class="form-control" id="writer" name="writer" value="${banner.writer}"
                            									required>
                            							</div>

                            							  <div class="form-group">
                                                                                        <label for="file">파일 업로드</label>
                                                                                        <input type="file" class="form-control" id="file" name="bannerImage" value="${banner.uploadFileName}" accept=".jpg, .jpeg, .png, .gif" required >
                                                                                    </div>
							<div class="form-group">
                                <label>광고여부</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="postYn" id="y" value="Y" <c:if test="${banner.postYn == 'Y'}">checked</c:if>>
                                    <label class="form-check-label" for="y">광고시작</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="postYn" id="n" value="N" <c:if test="${banner.postYn == 'N'}">checked</c:if>>
                                    <label class="form-check-label" for="female">광고중단</label>
                                </div>
                            </div>



 <button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


                        <form id="delete-btn" action="/ad/delete/${banner.id}" method="post">
                            <input type="hidden" name="_method" value="delete"/>
                            <button type="submit" class="btn btn-danger btn-submit">광고삭제</button>
                        </form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>



</body>


</html>


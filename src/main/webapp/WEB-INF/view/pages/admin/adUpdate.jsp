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
						<form action="/ad/edit/${banner.id}" id="edit-btn" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="_method" value="put" /> <input
								type="hidden" name="id" value="${banner.id}" />

							<div class="form-group">
								<label for="username">제목</label> <input type="text"
									class="form-control" id="title" name="title" 
									value="${banner.title}" required>
								<div id="titleFeedback" class="invalid-feedback"></div>
							</div>

							<div class="form-group">
								<label for="content">URL</label> <input type="text"
									class="form-control" id="content" name="content"
									value="${banner.content}" required>
							</div>
							<div class="form-group">
								<label for="name">광고주</label> <input type="text"
									class="form-control" id="writer" name="writer"
									value="${banner.writer}" required>
							</div>
							<div class="form-group">
								<label for="bannerImage">이미지 업로드</label> <input type="file"
									class="form-control" id="bannerImage" name="bannerImage">
								<div class="card mt-3">
									<div class="card-header bg-warning">현재 이미지</div>
									<div class="card-body">
									
										<div class="text-center">
										<img src="/images/upload/${banner.uploadFileName}" style="width:70%; height:70%;">
										</div>
									</div>
								</div>
							</div>



							<div class="form-group">
								<label>광고여부</label><br>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="postYn"
										id="Y" value="Y"
										<c:if test="${banner.postYn == 'Y'}">checked</c:if>> <label
										class="form-check-label" for="Y">광고시작</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="postYn"
										id="N" value="N"
										<c:if test="${banner.postYn == 'N'}">checked</c:if>> <label
										class="form-check-label" for="N">광고중단</label>
								</div>
							</div>



							<button type="submit" class="btn btn-primary btn-submit mb-3">수정하기</button>

						</form>


						<form id="delete-btn" action="/ad/delete/${banner.id}"
							method="post">
							<input type="hidden" name="_method" value="delete" />
							<button type="submit" class="btn btn-danger btn-submit">광고삭제</button>
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
	        event.preventDefault();
	        
	        // 이미지를 선택하지 않은 경우
	        if ($('#bannerImage').val() == '') {
	            alert('이미지를 선택해주세요.');
	            return false; // 폼 제출 취소
	        }

	        // FormData 객체 생성
	        var formData = new FormData();
	        formData.append('title', $('#title').val());
	        formData.append('content', $('#content').val());
	        formData.append('writer', $('#writer').val());
	        formData.append('postYn', $('input[name=postYn]:checked').val());
	        formData.append('bannerImage', $('#bannerImage')[0].files[0]); // 파일 추가

	        // AJAX를 사용하여 수정 요청 전송
	        $.ajax({
	            type: 'PUT',
	            url: '/ad/edit/${banner.id}',
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	                // 수정 성공 시 처리
	                alert('수정되었습니다.');
	                window.location.href = '/ad/list';
	            },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error(xhr.responseText);
	            }
	        });
	    });

	    // 삭제 버튼 클릭 시 얼럿창 표시
	    $('#delete-btn').submit(function(event) {
	        event.preventDefault();

	        var confirmation = confirm("광고를 삭제하시겠습니까?");

	        if (confirmation) {
	            // 확인을 눌렀을 때
	            $.ajax({
	                type: 'DELETE',
	                url: '/ad/delete/${banner.id}',
	                success: function(response) {
	                    alert('삭제되었습니다.');
	                    window.location.href = '/ad/list';
	                },
	                error: function(xhr, status, error) {
	                    console.error(xhr.responseText);
	                }
	            });
	        } else {
	            // 취소를 눌렀을 때
	            return false;
	        }
	    });
	});

	</script>

</body>


</html>

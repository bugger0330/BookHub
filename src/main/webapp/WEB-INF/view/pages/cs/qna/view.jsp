<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/csStyle.css" rel="stylesheet">
<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">문의하기</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="csMainContainer">

		<%-- <%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%> --%>

		<div class="container">

			<div class="container mt-3">

			

				<h2>문의글 상세보기</h2>
				<form>
					<div class="mb-3">
						<label for="title">Title:</label> <span id="title-display"></span>
					</div>
					<div class="mb-3">
						<label for="content">Content:</label> <span id="content-display"></span>
					</div>
					<div class="mb-3">
						<label for="filepath">File :</label> <span id="file-display"></span>
					</div>
				</form>
			</div>

			<div class="container mt-5">
				<h2>댓글 등록 폼</h2>
				<div class="form-group">
					<label for="commentContent">댓글 내용</label>
					<textarea class="form-control" id="reply-content" rows="3"
						placeholder="댓글 내용을 입력하세요"></textarea>
				</div>
				<button type="button" class="btn btn-primary" id="btn-save-reply">댓글
					등록</button>

				<div id="commentList" class="mt-4">
					<!-- 여기에 댓글 목록이 나열될 것입니다. -->
				</div>
			</div>

			<div>
				<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
				<button class="btn btn-warning" id="btn-update">수정하기</button>
				<button id="btn-delete" class="btn btn-danger">삭제하기</button>
			</div>


		</div>


	</div>
	</div>
</section>


<script>
	
</script>
<script src="/js/cs/csQna.js"></script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


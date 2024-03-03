<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">공지사항</h3>
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
				<h2>공지사항 상세보기</h2>
				<form>
					<div class="mb-3">
						<label for="title">Title:</label> <input type="text"
							class="form-control" id="title" name="title"
							readonly>
					</div>
					<div class="mb-3">
						<label for="content">Content:</label>
						<textarea id="content" name="content" readonly></textarea>
					</div>
				</form>
			</div>

			<div>
				<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
			</div>


			</div>


		</div>
	</div>
</section>
<script>
	$('#content').summernote(
			{
				tabsize : 2,
				height : 120,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>
<script src="/js/cs/csNotice.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



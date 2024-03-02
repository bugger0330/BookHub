<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

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

		<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>

		<div class="container">

			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">문의하기</li>
				</ol>
			</nav>

			<div class="container mt-3">
				<h2>문의글 상세보기</h2>
				<form>
					<div class="mb-3">
						<label for="title">Title :</label> <input type="text"
							class="form-control" id="title" name="title"
							readonly>
					</div>
					<div class="mb-3">
						<label for="content">Content :</label>
						<textarea id="content" name="content" readonly></textarea>
					</div>
					<div class="mb-3">
						<label for="filepath">File :</label>
						<input type="text"
							 id="file" name="filepath">
					</div>
				</form>
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
<script src="/js/csViewScript.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



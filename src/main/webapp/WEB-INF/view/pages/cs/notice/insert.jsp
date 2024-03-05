<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


	<!-- 서머노트 -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">공지사항 작성</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="csMainContainer">

		<div class="container">

			<div class="container mt-3">
				<h2 style="margin-bottom: 30px;">공지사항 작성하기</h2>
				<form method="post" action="/qna/insert" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="title">제목:</label> <input type="text" class="form-control" id="title" name="title"
							placeholder="Enter Title">
					</div>
					<div class="mb-3">
						<label for="content">내용:</label>
						<textarea id="content" name="content"></textarea>
					</div>
					<div class="file_list">
						<div class="mb-3">
							<div class="file_input"
								style="display: inline-block; ">
								<label for="formFileMultiple" class="form-label">File: </label>
								<input class="form-control" type="file" id="formFileMultiple" multiple name="filepath" onchange="selectFile(this);"
									style="background-color: white;" />
							</div>
							<button type="button" onclick="removeFile(this);" class="btn btn-outline-danger">
								<span>삭제</span>
							</button>
							<button type="button" onclick="addFile();" class="btn btn-outline-primary">
								<span>파일 추가</span>
							</button>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" id="btn-insert">작성하기</button>
				</form>
				
			</div>

		</div>
	</div>

</section>

<script type="text/javascript">
// 파일 선택
function selectFile(element) {

    const file = element.files[0];
    const filename = element.closest('.file_input').firstElementChild;

    // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
    if ( !file ) {
        filename.value = '';
        return false;
    }

    // 2. 파일 크기가 10MB를 초과하는 경우
    const fileSize = Math.floor(file.size / 1024 / 1024);
    if (fileSize > 10) {
        alert('10MB 이하의 파일로 업로드해 주세요.');
        filename.value = '';
        element.value = '';
        return false;
    }

    // 3. 파일명 지정
    filename.value = file.name;
}

let fileCount = 0;

// 파일 추가
function addFile() {
    if (fileCount < 1) {
        const fileDiv = document.createElement('div');
        fileDiv.classList.add('file_input');

        fileDiv.innerHTML = `
        	<div class="file_input" style="display: inline-block; ">
			<label for="formFileMultiple" class="form-label">File: </label> <input
			class="form-control" type="file" id="formFileMultiple" multiple
			name="filepath" onchange="selectFile(this);" style="background-color: white;" />
		</div>
        <button type="button" onclick="removeFile(this);" class="btn btn-outline-danger"><span>삭제</span></button>
        `;

        document.querySelector('.file_list').appendChild(fileDiv);
        fileCount++;
    } else {
        alert('최대 1개의 파일만 추가 가능합니다.');
    }
}


// 파일 삭제
function removeFile(element) {
    const fileAddBtn = element.nextElementSibling;
    if (fileAddBtn) {
        const inputs = element.previousElementSibling.querySelectorAll('input');
        inputs.forEach(input => input.value = '')
        return false;
    }
    element.parentElement.remove();
}

</script>


<script>
	$('#content').summernote(
			{
				tabsize : 2,
				height : 200,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
				
			});
</script>
<script src="/js/cs/csNotice.js"> 
	
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
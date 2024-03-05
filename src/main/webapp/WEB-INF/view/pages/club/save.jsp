<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.rounded-input {
	border-radius: 10px;
	border: 1px solid #ced4da; /* 테두리 스타일 및 색상 설정 */
	padding: 10px; /* 내부 여백 설정 */
}
</style>



<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">모임 개설</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<!-- Main Start -->
<!-- Tour Booking Start -->
<div class="container-fluid booking py-5">
	<div class="container py-5">
		<div class="row g-5 align-items-center">
			<!-- mx-auto로 수평 가운데 정렬 -->
			<div class="col-lg-6 mx-auto" style="width: 80%;">
				<h1 class="text mb-3">
					모임 개설 시 <span class="text-warning">5000포인트 </span>가 필요합니다.
				</h1>
				<p class="text mb-4"></p>
				<!-- 독서모임 신청 form -->
				<!-- Ajax로 데이터 보낼거니까 url이랑 전송방식 form에 설정할 필요없다 -->
				<!-- 텍스트 크기 설정 -->
				<form enctype="multipart/form-data" style="font-size: 20px">
					<div class="row g-3">
						<div class="col-md-6">
							<div class="form-floating">
								<input type="text" class="form-control bg-white  rounded-input"
									name="clubName" placeholder="독서모임명"> <label for="name">독서모임명</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<input type="text" class="form-control bg-white  rounded-input"
									name="host" placeholder="주최자"> <label for="name">주최자</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<input type="number" min="1"
									class="form-control bg-white rounded-input" name="headCount"
									placeholder="숫자"> <label for="name">최대인원</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating date" id="date3"
								data-target-input="nearest">
								<!-- type 변경으로 달력 출력함!!! -->
								<!-- 최솟값 주기 위해 min 설정 -->
								<input type="datetime-local" min=""
									class="datepicker-input form-control bg-white  rounded-input"
									id="datetime" placeholder="Date & Time" data-target="#date3"
									data-toggle="datetimepicker" name="cDate" /> <label
									for="datetime">모임날짜</label>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-floating">
								<select class="form-select bg-white  rounded-input"
									id="CategoriesSelect" name="clubCate">
									<option value="1">커리어 성장</option>
									<option value="2">예술과 문학</option>
									<option value="3">금융/경제/투자</option>
									<option value="4">영화와 책</option>
									<option value="5">과학과 철학</option>
									<option value="6">기타</option>
								</select> <label for="CategoriesSelect" style="margin-bottom: 5px">카테고리</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<textarea class="form-control bg-white  rounded-input"
									placeholder="Special Request" id="message"
									style="height: 100px" name="descript"></textarea>
								<label for="message">모임소개</label>
							</div>
						</div>
						<div class="col-12">
							<div class="form-floating">
								<textarea class="form-control bg-white  rounded-input"
									placeholder="Special Request" id="message"
									style="height: 100px" name="detail"></textarea>
								<label for="message">모임내용</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile"
									name="customFile" style="margin-top: 10px;">
							</div>
							<!-- 미리보기 -->
							<img src="" alt="미리보기" id="preview"
								style="display: none; max-width: 100%; margin-top: 10px;">
						</div>
						<br /> <br /> <br />
						<div class="col-12">
							<button id="form--button" class="btn btn-primary text w-100 py-3"
								type="submit" style="font-size: 30px">개설하기</button>
						</div>
					</div>
				</form>
				<!-- form end -->
			</div>
		</div>
	</div>
</div>
<!-- Tour Booking End -->



<!-- main end -->

<!-- 모달 시작 -->
<div class="modal fade" id="pointModal" tabindex="-1"
	aria-labelledby="pointModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="pointModalLabel">포인트 사용 여부</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">포인트를 사용하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="confirmPointBtn">확인</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<!-- 모달 시작 -->
<div class="modal fade" id="falseModal" tabindex="-1"
	aria-labelledby="pointModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="pointModalLabel">포인트 사용 여부</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">포인트가 부족합니다</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->




<script src="/js/club/save.js"></script>

<!-- 파일 업로드 -->
<script>
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>






<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

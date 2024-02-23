<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>



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
			<div class="col-lg-6">
				<h5 class="section-booking-title pe-3">Booking</h5>
				<h1 class="text mb-4">Online Booking</h1>
				<p class="text mb-4">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Aspernatur maxime ullam esse fuga blanditiis
					accusantium pariatur quis sapiente, veniam doloribus praesentium?
					Repudiandae iste voluptatem fugiat doloribus quasi quo iure
					officia.</p>
				<p class="text mb-4">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Aspernatur maxime ullam esse fuga blanditiis
					accusantium pariatur quis sapiente, veniam doloribus praesentium?
					Repudiandae iste voluptatem fugiat doloribus quasi quo iure
					officia.</p>
				<a href="#"
					class="btn btn-light text-primary rounded-pill py-3 px-5 mt-2">Read
					More</a>
			</div>
			<div class="col-lg-6">
				<h1 class="text mb-3">Book A Tour Deals</h1>
				<p class="text mb-4">
					Get <span class="text-warning">50% Off</span> On Your First
					Adventure Trip With Travela. Get More Deal Offers Here.
				</p>
				<form action="/club/save" method="post" enctype="multipart/form-data">
					<div class="row g-3">
						<div class="col-md-6">
							<div class="form-floating">
								<input type="text" class="form-control bg-white border-0"
									name="clubName" placeholder="독서모임명"> <label for="name">독서모임명</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<input type="text" class="form-control bg-white border-0"
									name="host" placeholder="주최자"> <label for="name">주최자</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<input type="text" class="form-control bg-white border-0"
									name="headCount" placeholder="숫자"> <label for="name">정원(숫자)</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating date" id="date3"
								data-target-input="nearest">
								<input type="text" class="datepicker-input form-control bg-white border-0"
									id="startDate" placeholder="Date & Time" data-target="#date3"
									data-toggle="datetimepicker" name="cDate" /> <label for="datetime">날짜</label>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-floating">
								<select class="form-select bg-white border-0"
									id="CategoriesSelect" name="clubCate">
									<option value="1">test1</option>
									<option value="2">test2</option>
								</select> <label for="CategoriesSelect">카테고리</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile"
									name="customFile"> <label class="custom-file-label"
									for="customFile">Choose file</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating">
								<textarea class="form-control bg-white border-0"
									placeholder="Special Request" id="message"
									style="height: 100px" name="descript"></textarea>
								<label for="message">소개</label>
							</div>
						</div>
						<div class="col-12">
							<div class="form-floating">
								<textarea class="form-control bg-white border-0"
									placeholder="Special Request" id="message"
									style="height: 100px" name="detail"></textarea>
								<label for="message">상세설명</label>
							</div>
						</div>
						<div class="col-12">
							<button class="btn btn-primary text w-100 py-3" type="submit">Book
								Now</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Tour Booking End -->



<!-- main end -->




<script src="/js/club/save.js"></script>

<!-- 파일 업로드 -->
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>






<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

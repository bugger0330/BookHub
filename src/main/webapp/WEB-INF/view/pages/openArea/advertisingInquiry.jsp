<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 요금제</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.card {
	border: none;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.card:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.card-img {
	width: 100%;
	height: auto;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/view/layout/header.jsp"%>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">광고 문의하기</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="container-sm text-center wow fadeInUp mb-5" data-wow-delay="0.1s">
    <h6 class="section-title bg-white text-center text-primary px-3">Advertising</h6>
    <h1 class="mb-3">BookHub 사이트 광고문의</h1>
    <h5>아래 양식을 작성하여 보내주시면 검토 후 신속하게 답변해드리겠습니다.</h5>

   <form action="/submit_advertisement" method="post" enctype="multipart/form-data" class="rounded p-4 bg-light">
        <div class="form-group row">
            <label for="contact_person" class="col-sm-2 col-form-label">담당자명</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="contact_person" name="contact_person" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="phone_number" class="col-sm-2 col-form-label">연락처(휴대전화)</label>
            <div class="col-sm-10">
                <input type="tel" class="form-control" id="phone_number" name="phone_number" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="message" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>
        </div>
        <div class="form-group row">
    <label for="advertisement_image" class="col-sm-2 col-form-label">광고이미지 첨부</label>
    <div class="col-sm-10">
     <h5 style="color: red;">★★★광고이미지는 가로형 이미지만 가능합니다.★★★</h5>
     <img  src="/img/bannerexam.jpg" class="m-3">
        <div class="custom-file">
       
            <input type="file" class="custom-file-input" id="advertisement_image" name="advertisement_image" accept="image/*" required>
            <label class="custom-file-label" for="advertisement_image"></label>
        </div>
    </div>
</div>

       <div class="form-group row justify-content-center">
    <div class="col-sm-10">
        <button type="submit" class="btn btn-primary">제출</button>
    </div>
</div>
    </form>
</div>



	


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>
</html>

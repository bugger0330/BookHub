<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">안녕하세요, Book Hub입니다.</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	
	 <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                            <h5 class="mb-3">도서검색</h5>
                            <p>읽고싶은 책을 검색하여 <br/>독서를 시작하세요!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-people-arrows text-primary mb-4"></i>
                            <h5 class="mb-3">독서모임</h5>
                            <p>다양한 사람들과 <br/> 의견을 나누어보세요!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x  fa-leaf text-primary mb-4"></i>
                            <h5 class="mb-3">도서기부</h5>
                            <p>도서를 기부하여 <br/> 지구를 지켜주세요!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-bookmark text-primary mb-4"></i>
                            <h5 class="mb-3">BookHub 구독제 운영</h5>
                            <p>경제적인 가격으로 <br/> BookHub를 구독하세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="img-fluid position-absolute w-100 h-100" src="img/about.jpg" alt="" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                    <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                    <h1 class="mb-4">Welcome to BookHub!</h1>
                    <p class="mb-4">친환경 도서관 BookHub에 오신것을 환영합니다.</p>
                    <p class="mb-4">BookHub 회원이 되시면<br/> 도서대출, 독서모임활동, 기부 등 많은 기능을 이용하실 수 있습니다.</p>
                    <div class="row gy-2 gx-4 mb-4">
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>도서 대출/반납</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>독서 모임 개설</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>도서관 자리지정</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>독서 토론</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>도서 기부</p>
                        </div>
                       
                    </div>
                    <a class="btn btn-primary py-3 px-5 mt-2" href="/login">회원가입하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


      <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
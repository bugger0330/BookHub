<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Carousel Start -->
<div class="container-fluid p-0 mb-5">
	<div class="owl-carousel header-carousel position-relative">
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid" src="/img/carousel-1.jpg" alt="">
			<div
				class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
				style="background: rgba(24, 29, 56, .7);">
				<div class="container">
					<div class="row justify-content-start">
						<div class="col-sm-10 col-lg-8">
							<h5 class="text-primary text-uppercase mb-3 animated slideInDown">독서와
								무제한으로 친해지기</h5>
							<h1 class="display-3 text-white animated slideInDown">
								책을 읽는 것은 <br />삶의 모험을 <br /> 떠나는 것과 같습니다.
							</h1>
							<p class="fs-5 text-white mb-4 pb-2">
								당신의 독서 여정을 새롭게 시작해보세요. 책의 세계로 오신 것을 환영합니다. <br />함께하는 독서의 즐거움과
								지식의 보물을 만나보세요.
							</p>
							<a href=""
								class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">도서 구경하기
								</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid" src="/img/carousel-2.jpg" alt="">
			<div
				class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
				style="background: rgba(24, 29, 56, .7);">
				<div class="container">
					<div class="row justify-content-start">
						<div class="col-sm-10 col-lg-8">
							<h5 class="text-primary text-uppercase mb-3 animated slideInDown">독서
								토론으로 지식을 나누세요</h5>
							<h1 class="display-3 text-white animated slideInDown">
								한 책, <br />다양한 의견. <br />함께하는 독서 토론의 가치.
							</h1>
							<p class="fs-5 text-white mb-4 pb-2">책을 읽는 것은 혼자 하는 여행이지만,
								그것을 나누는 것은 함께하는 모험입니다.</p>
							<a href=""
								class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">모임 개설하기
								</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid" src="/img/carousel-3.jpg" alt="">
			<div
				class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
				style="background: rgba(24, 29, 56, .7);">
				<div class="container">
					<div class="row justify-content-start">
						<div class="col-sm-10 col-lg-8">
							<h5 class="text-primary text-uppercase mb-3 animated slideInDown">도서
								기부로 환경 보호하기</h5>
							<h1 class="display-3 text-white animated slideInDown">
								책을 기부하고, <br />지구를 사랑하세요.
							</h1>
							<p class="fs-5 text-white mb-4 pb-2">책을 기부하는 것은 우리의 소중한 자원을
								재활용하고 지구의 자연을 보호하는 작은 일입니다. 함께 나눔의 가치를 실천하며 우리의 지구를 지켜나가는 여정에
								동참해보세요.</p>
							<a href=""
								class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">책 기부하기
								</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Carousel End -->


<!-- 메인 컨텐츠부분 시작 -->
<div class="container">

<!-- 통합 검색 시작 -->
	<div>
		<h2>
			<i class="fa-solid fa-magnifying-glass me-3"></i>도서통합검색
		</h2>

		<div class="position-relative mx-auto mb-5">
			<input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text"
				placeholder="검색하실 도서명을 입력하세요." style="background-color: #E6E6E6;">
			<button type="button"
				class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">도서찾기</button>
		</div>
	</div>
	<!-- 통합검색 끝 -->

    <!-- 광고영역 -->
    <c:choose>
        <c:when test="${not empty banner}">
       <!-- Carousel Start -->
       <div class="container-fluid p-0 mb-5" style="height: 200px">
       	<div class="owl-carousel header-carousel position-relative">
       	 <c:forEach var="ad" items="${banner}">
       		<div class="owl-carousel-item position-relative">

       			<a href="${ad.content}"><img class="img-fluid" src="/images/upload/${ad.uploadFileName}" style="height: 200px" alt=""/></a>

       		</div>
       		  </c:forEach>

       	</div>
       </div>
       <!-- Carousel End -->

            </c:when>
            <c:otherwise>
            <div class="container">
            <p class="text-center"></p>
            </div>
            </c:otherwise>
            </c:choose>


    <!-- 광고 끝 -->

	<!-- BookHub 둘러보기 시작 -->
	<div style="display: flex; align-items: center;">
    <h2 style="margin-right: auto;">
       <i class="fa-solid fa-flag me-3"></i>Book Hub 소식
    </h2>


</div>

<h4>공지사항 부분</h4>

	<!-- BookHub 둘러보기 끝 -->



    <!-- Categories Start -->
    <div class="container-xxl py-5 category">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">BookHub 둘러보기</h6>
                <h1 class="mb-5">Quick Link</h1>
            </div>
            <div class="row g-3">
                <div class="col-lg-7 col-md-6">
                    <div class="row g-3">
                        <div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
                            <a class="position-relative d-block overflow-hidden" href="/about">
                                <img class="img-fluid" src="/img/cat-1.jpg" alt="">
                                <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">BookHub 소개</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
                            <a class="position-relative d-block overflow-hidden" href="">
                                <img class="img-fluid" src="/img/cat-2.jpg" alt="">
                                <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">추천도서</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
                            <a class="position-relative d-block overflow-hidden" href="">
                                <img class="img-fluid" src="/img/cat-3.jpg" alt="">
                                <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">모임개설하기</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s" style="min-height: 350px;">
                    <a class="position-relative d-block h-100 overflow-hidden" href="">
                        <img class="img-fluid position-absolute w-100 h-100" src="/img/cat-4.jpg" alt="" style="object-fit: cover;">
                        <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin:  1px;">
                            <h5 class="m-0">책 기부하기</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Categories Start -->




    <!-- Courses Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Subscribe</h6>
                <h1 class="mb-3">BookHub 구독요금제</h1>
                <h4>경제적인 가격으로 BookHub를 이용해보세요!</h4>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid" src="/img/course-1.jpg" alt="">
                        </div>
                        <div class="text-center p-4">
                            <h3 class="mb-0">3,000 원</h3>
                            <h5 class="mb-4">7일권</h5>
                             <div class=" justify-content-center  bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px;">구매하기</a>
                            </div>
                        </div>
                       
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid" src="/img/course-2.jpg" alt="">
                            
                        </div>
                         <div class="text-center p-4">
                            <h3 class="mb-0">15,000 원</h3>
                            <h5 class="mb-4">30일권</h5>
                             <div class=" justify-content-center  bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px;">구매하기</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid" src="/img/course-3.jpg" alt="">
                            
                        </div>
                         <div class="text-center p-4">
                            <h3 class="mb-0">35,000 원</h3>
                            <h5 class="mb-4">1년권</h5>
                             <div class=" justify-content-center  bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px;">구매하기</a>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Courses End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Best Author</h6>
                <h1 class="mb-5">베스트셀러 작가를 소개합니다.</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="/img/team-1.jpg" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                         
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="mb-0">버지니아 사티어</h5>
                            <small>아이는 무엇으로 자라는가</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="/img/team-2.jpg" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                        </div>
                       <div class="text-center p-4 mt-3">
                            <h5 class="mb-0">버지니아 사티어</h5>
                            <small>아이는 무엇으로 자라는가</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="img/team-3.jpg" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="mb-0">버지니아 사티어</h5>
                            <small>아이는 무엇으로 자라는가</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="/img/team-4.jpg" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="mb-0">버지니아 사티어</h5>
                            <small>아이는 무엇으로 자라는가</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3">Best Review</h6>
                <h1 class="mb-5">이용고객님들의 솔직후기 입니다!</h1>
            </div>
            <div class="owl-carousel testimonial-carousel position-relative">
                <div class="testimonial-item text-center">
                    <img class="border rounded-circle p-2 mx-auto mb-3" src="/img/testimonial-1.jpg" style="width: 80px; height: 80px;">
                    <h5 class="mb-4">김철수 고객님</h5>
                    <div class="testimonial-text bg-light text-center p-4">
                    <p class="mb-0">BookHub 추천추천!</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="border rounded-circle p-2 mx-auto mb-3" src="/img/testimonial-2.jpg" style="width: 80px; height: 80px;">
                    <h5 class="mb-4">김철수 고객님</h5>
                    <div class="testimonial-text bg-light text-center p-4">
                    <p class="mb-0">BookHub 추천추천!</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="border rounded-circle p-2 mx-auto mb-3" src="/img/testimonial-3.jpg" style="width: 80px; height: 80px;">
                   <h5 class="mb-4">김철수 고객님</h5>
                    <div class="testimonial-text bg-light text-center p-4">
                    <p class="mb-0">BookHub 추천추천!</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="border rounded-circle p-2 mx-auto mb-3" src="/img/testimonial-4.jpg" style="width: 80px; height: 80px;">
                   <h5 class="mb-4">김철수 고객님</h5>
                    <div class="testimonial-text bg-light text-center p-4">
                    <p class="mb-0">BookHub 추천추천!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
        
	
	
	


</div>
<!-- 메인 컨텐츠부분 끝 -->



<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


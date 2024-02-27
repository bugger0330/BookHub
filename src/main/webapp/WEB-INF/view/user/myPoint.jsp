<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

</head>
<body>


	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">포인트 현황 및 구독</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div>
	
	</div>

    <!-- 구독요금제 Start -->
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
                            <img class="img-fluid" src="img/course-1.jpg" alt="">
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
                            <img class="img-fluid" src="img/course-2.jpg" alt="">
                            
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
                            <img class="img-fluid" src="img/course-3.jpg" alt="">
                            
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
    <!-- 구독요금제 End -->

</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">모임 소개</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	
	<!-- Main Start -->
	<!-- Single Product Start -->
		<!-- 가운데로 배치하기 위해 margin-left 이용 -->
        <div class="container-fluid py-5 mt-5" style="margin-left: 10%;">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                           		<!-- class에 있는 border rounded 빼기 -->
                                <div class="">
                                    <a href="#">
                                        <img src="${club.setupClubImage()}" class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                            </div>
                            <!-- padding 속성으로 텍스트 배치하기 -->
                            <div class="col-lg-6" style="padding-left: 10%;">
                            	<!-- javascript 이용하기 위해 hidden 태그 사용하기 -->
                                <input id="club--id" value="${club.id}" hidden>
                                
                                <h4 class="fw-bold mb-3">${club.clubName}</h4>
                                <p class="mb-3">${club.descript}</p>
                                <h5 id="club-status" class="fw-bold mb-3">${club.status}</h5>
                                <h5 class="fw-bold mb-3">인원 : ${club.hcApply} / ${club.headCount}</h5>
                                <input id="club--hcapply" value="${club.hcApply}" hidden>
                                <input id="club--headcount" value="${club.headCount}" hidden>
                                
                                <p class="mb-4">모임날짜 ${club.formatCDate()}</p>
                                
                                <!-- 찜하기 -->
                                <i data-id="${club.id}" data-principal="${principal }" name="wishButton" class="bi-heart" style="font-size: 50px; color: #06BBCC !important"></i>
                                <!-- 사용자 아이디값 가져오기 -->
                                <a id="apply--button" data-username="${userName}" href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">신청하기</a>
                            </div>
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">모임내용</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <!-- DB에 입력된 것처럼 줄바꿈 허용하는 기능! -->
                                        <p style="white-space: pre-wrap;">${club.detail}</p>
                                        
                                        
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        <div class="d-flex">
                                            <img src="/img/clubavatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Jason Smith</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic 
                                                    words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <img src="/img/clubavatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Sam Peters</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p class="text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic 
                                                    words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div>
                            </div>
                            <form action="#">
                               
                            </form>
                        </div>
                    </div>
                    
                </div>
                
            </div>
       	</div>
        <!-- Single Product End -->
	
	
	
	<!-- main end -->
<!-- 스크립트 경로 2개 설정하면 하나 적용 안되네!!! -->
<script src="/js/club/view.js"></script>





<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

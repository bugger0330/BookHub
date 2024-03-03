<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">독서모임</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	
	<!-- Main Start -->
	
	<!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                    	<div class="position-relative mx-auto">
                            <form action="/club/searchList" method="get">
	                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" name="keyword" type="text" value="${keyword} " placeholder="Search">
	                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">검색</button>
                        	</form>
                        </div>    
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- Hero End -->


        


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    
                                    <!-- empty 키워드는 변수가 null이거나 비어있는 경우를 확인 -->
                                    <c:if test="${empty clubList}">
                                    	<h1>검색결과 없습니다</h1>
                                    </c:if>
                                    
                                    <!-- 반복문 시작 -->
                                    <c:forEach var="club" items= "${clubList}">
                                    	<!-- 한줄에 4개씩 차지해서 2개씩 차지도록 부트스트랩 클래스명 바꿈 -->
                                    	<!-- <div class="col-md-6 col-lg-4 col-xl-3"> -->
                                    	<div class="col-md-6 col-lg-6 col-xl-6">
                                    		<a href="/club/view/${club.id}">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="${club.setupClubImage()}" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>${club.clubName}</h4>
                                                    <p>${club.descript}</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${club.hcApply} / ${club.headCount}</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                    
                                        
                                       <!-- 반복문 끝 -->
                                        
                                        
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="/img/club/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Grapes</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="/img/club/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Grapes</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->


        
	
	<!-- Main End -->
<script src="/js/club/searchlist.js"></script>	


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

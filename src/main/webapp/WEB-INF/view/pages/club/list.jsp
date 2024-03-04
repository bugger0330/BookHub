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
                        <!-- clubCate값에 따라 다르게 출력하기 -->
                        <c:choose>
	                        <c:when test="${clubCate == 1 }">
	                        	<h1 class="mb-5 display-3 text-primary">커리어 성장</h1>
	                        	<h4 class="mb-3 text-secondary">일을 잘 하고 싶은 사람들이 모여 고민과 인사이트를 나누는 모임</h4>
	                        </c:when>
	                        <c:when test="${clubCate == 2 }">
	                        	<h1 class="mb-5 display-3 text-primary">예술과 문학</h1>
	                        	<h4 class="mb-3 text-secondary">똑같은 일상도 새롭게 느낄 수 있게 도와주는 예술과 문학 모임</h4>
	                        </c:when>
	                        <c:when test="${clubCate == 3 }">
	                        	<h1 class="mb-5 display-3 text-primary">금융/경제/투자</h1>
	                        	<h4 class="mb-3 text-secondary">자본주의 시대에 꼭 갖춰야 할 역량을 키우는 모임</h4>
	                        </c:when>
	                        <c:when test="${clubCate == 4 }">
	                        	<h1 class="mb-5 display-3 text-primary">영화와 책</h1>
	                        	<h4 class="mb-3 text-secondary">책과 영화를 함께 감상하고 깊이 있는 대화를 하는 모임</h4>
	                        </c:when>
	                        <c:when test="${clubCate == 5 }">
	                        	<h1 class="mb-5 display-3 text-primary">과학과 철학</h1>
	                        	<h4 class="mb-3 text-secondary">인류가 쌓아온 지혜, 과학과 철학을 탐구하는 모임</h4>
	                        </c:when>
	                        <c:otherwise>
	                        	<h1 class="mb-5 display-3 text-primary">기타</h1>
	                        	<h4 class="mb-3 text-secondary">주제와 장르를 가리지 않고 경계 없이 다채롭게 책을 읽는 모임</h4>
	                        </c:otherwise>
                        </c:choose>
                        
                        <div class="position-relative mx-auto">
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5 text-center">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                	<!-- clubCate값에 따라 다르게 출력하기 -->
                                	<c:choose>
				                        <c:when test="${clubCate == 1 }">
				                        	<img src="/img/club/category/커리어 성장.png" class="bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:when>
				                        <c:when test="${clubCate == 2 }">
				                        	<img src="/img/club/category/예술과 문학.png" class=" bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:when>
				                        <c:when test="${clubCate == 3 }">
				                        	<img src="/img/club/category/금융_경제_투자.png" class="bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:when>
				                        <c:when test="${clubCate == 4 }">
				                        	<img src="/img/club/category/영화와 책.png" class="bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:when>
				                        <c:when test="${clubCate == 5 }">
				                        	<img src="/img/club/category/과학과 철학.png" class="bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:when>
				                        <c:otherwise>
				                        	<img src="/img/club/category/기타.png" class="bg-secondary rounded" style="width: 500px; height: 500px;" alt="First slide">
				                        </c:otherwise>
			                        </c:choose>
                                	
                                    
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                
                            </div>
                            
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
                                    
                                    <!-- 반복문 시작 -->
                                    <c:forEach var="club" items= "${clubList}">
                                    	<!-- 한줄에 4개씩 차지해서 2개씩 차지도록 부트스트랩 클래스명 바꿈 -->
                                    	<!-- <div class="col-md-6 col-lg-4 col-xl-3"> -->
                                    	<div class="col-md-6 col-lg-4 col-xl-4">
                                    		<a href="/club/view/${club.id}">
	                                           <div class="rounded position-relative fruite-item">
	                                               <div class="fruite-img">
	                                               		<!-- 첨부 파일에 따라 이미지 크기가 달라져서 height 값 고정함 -->
	                                                   <img src="${club.setupClubImage()}" class="img-fluid w-100 rounded-top" style="height: 380px;" alt="">
	                                               </div>
	                                               <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                   <h4>${club.clubName}</h4>
	                                                   <p>${club.descript}</p>
	                                                   <div class="d-flex justify-content-between flex-lg-wrap">
	                                                   		<!-- Club의 cDate 타입이 Timestamp라 바로 출력이 안되서 포멧해줘야함(문자열로) -->
						                                    <p class="text-dark fs-5 fw-bold mb-0" style="margin-top: 10px;">${club.formatCDate()}</p>
						                                    <i data-id="${club.id}" data-principal="${principal }" name="wishButton" class="bi-heart" style="font-size: 50px"></i>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                       	</a>
                                        </div>
                                    </c:forEach>
                                    
                                        
                                       <!-- 반복문 끝 -->
                                        
                                        
                                        
                                        
                                        
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
	
<script src="/js/club/wishlist.js"></script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

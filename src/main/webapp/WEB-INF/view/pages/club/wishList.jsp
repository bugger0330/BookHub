<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">찜</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<!-- Main Start -->
	
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
                                    <c:if test="${empty clubWishList}">
                                    	<h1>찜한 모임이 없습니다</h1>
                                    </c:if>
                                    
                                    <!-- 반복문 시작 -->
                                    <c:forEach var="clubWishItem" items= "${clubWishList}">
                                   	<!-- 한줄에 2개씩 차지하기 -->
                       			   	<div class="col-md-6 col-lg-6 col-xl-6">
                              			<a href="/club/view/${clubWishItem.clubId}">
                                           <div class="rounded position-relative fruite-item">
                                               <div class="fruite-img">
                                               		<!-- 첨부 파일에 따라 이미지 크기가 달라져서 height 값 고정함 -->
                                                   <img src="${clubWishItem.setupClubImage()}" class="img-fluid w-100 rounded-top" style="height: 380px;" alt="">
                                               </div>
                                               <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                   <h4>${clubWishItem.clubName}</h4>
                                                   <p>${clubWishItem.descript}</p>
                                                   <div class="d-flex justify-content-between flex-lg-wrap">
                                                   		<!-- Club의 cDate 타입이 Timestamp라 바로 출력이 안되서 포멧해줘야함(문자열로) -->
					                                    <p class="text-dark fs-5 fw-bold mb-0" style="margin-top: 10px;">${clubWishItem.formatCDate()}</p>
					                                    <!-- 찜 페이지는 하트 채워진 상태로 표시 -->
					                                    <i data-id="${clubWishItem.clubId}" name="wishButton" class="bi-heart-fill" style="font-size: 50px"></i>
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

<script src="/js/club/wishlistpage.js"></script>	


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

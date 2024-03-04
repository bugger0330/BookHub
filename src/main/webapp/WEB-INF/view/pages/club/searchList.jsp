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
                      <h4 class="mb-3 text-secondary">독서와 무제한으로 친해지기</h4>
                      <h1 class="mb-5 display-3 text-primary">BookHub</h1>
                      <div class="position-relative mx-auto">
                          <form action="/club/searchList" method="get">
                          	<!-- 검색어 입력후 value값 가져오기 -->
                           	<input id="searchInput" class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" name="keyword" type="text" value="${keyword}" placeholder="모임검색">
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
                                    	<h1>검색결과가 없습니다</h1>
                                    </c:if>
                                    
                                    <!-- 반복문 시작 -->
                                    <c:forEach var="club" items= "${clubList}">
                                   	<!-- 한줄에 4개씩 차지해서 col-xl-3을 수정 -->
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
					                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>찜하기</a>
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

<!-- 모달 시작 -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        검색어를 입력하세요
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->
	
<script src="/js/club/index.js"></script>	


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

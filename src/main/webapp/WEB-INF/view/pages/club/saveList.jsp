<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">개설 내역</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<!-- Main Start -->
<!-- empty 키워드는 변수가 null이거나 비어있는 경우를 확인 -->
   <c:if test="${empty clubList}">
   	<h1 style="margin-left: 40%;">개설한 모임이 없습니다</h1>
   </c:if>

<c:forEach var="club" items= "${clubList}">
	<div class="card center mx-auto" style="width: 30%;">
		<a href="/club/view/${club.id }">
		<!-- max속성으로 너비, 높이 100%로 꽉차도록 함 / object-fit: cover; 하면 이미지 안에 개체도 꽉참 -->
		  <img class="card-img-top" src="${club.setupClubImage()}" style="width:100%; height:100%;" alt="Card image">
		</a>	  
	  	<div class="card-body">
		    <h4 class="card-title text-center">${club.clubName}</h4>
		    <p class="card-text text-center">개설일 : ${club.formatCreatedAt()}</p>
	    <!--  data-toggle="modal" data-target="#deleteModal" 추가 -->
		    <a data-id="${club.id }" href="#" class="btn btn-primary" >개설 취소</a>
	  	</div>
	</div>
	<br>
	<br>
</c:forEach>


<!-- main end -->
<!-- 모달 시작 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button id="close" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        개설 취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="confirmDeleteBtn">확인</button>
        <button type="button" class="btn btn-secondary" id="cancelDeleteBtn" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->
	
<script src="/js/club/savelist.js"></script>	
	


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

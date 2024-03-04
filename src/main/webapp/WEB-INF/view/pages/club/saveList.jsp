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
    	<h1>개설한 모임이 없습니다</h1>
    </c:if>

	
	<c:forEach var="club" items= "${clubList}">
		<div class="card center mx-auto" style="width:450px; height: 450px">
			<a href="/club/view/${club.id }" style="height: 310px;">
			  <img class="card-img-top" src="/images/upload/${club.uploadFileName1}" style="max-width:100%; max-height:100%; object-fit: cover;" alt="Card image">
			</a>	  
		  	<div class="card-body">
			    <h4 class="card-title text-center">${club.clubName}</h4>
			    <p class="card-text text-center">개설일 : ${club.formatCreatedAt()}</p>
			    <a href="#" class="btn btn-primary">개설 취소</a>
		  	</div>
		</div>
		<br>
		<br>
	</c:forEach>
	
	
	<!-- main end -->
	
	
	


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

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
	<c:forEach var="club" items= "${clubList}">
		<div class="card center mx-auto" style="width:450px; height: 450px">
		  <img class="card-img-top" src="${club.setupClubImage()}" alt="Card image">
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- CS aside Start -->
  
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<span class="fs-4">열린공간</span>
		</a>
		<c:forEach var="list" items="${cate2list}">
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> ${list.c2Name}  </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
		</ul>
		</c:forEach>
		<hr>
	</div>
  
  <!-- CS aside End -->
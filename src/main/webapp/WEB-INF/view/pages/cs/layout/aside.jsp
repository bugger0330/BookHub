<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- CS aside Start -->
  
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<span class="fs-4">대분류</span>
		</a>
		<hr>
		<c:forEach var="list" items="${cate1list}">
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> ${list.c1Name}  </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
		</ul>
		</c:forEach>
		<c:forEach var="list2" items="${cate2list}">
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> ${list2.c2Name}  </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
			<li><a href="#" class="nav-link link-dark"> 1차 카테 </a></li>
		</ul>
		</c:forEach>
		<hr>
	</div>
	
	
	<%-- <aside>
                    <h2>공지사항</h2>
                    <input type="hidden" th:value="${cate1}">
                    <ul>
                        <li th:class="${cate1 == null or cate1 == '' ? 'on' : ''}">
                            <a th:href="@{/cs/notice/list}" >전체</a>
                        </li>
                        <li th:class="${cate1 == '10' ? 'on' : ''}">
                            <a th:href="@{/cs/notice/list(cate1=10)}">고객서비스</a>
                        </li>
                        <li th:class="${cate1 == '11' ? 'on' : ''}">
                            <a th:href="@{/cs/notice/list(cate1=11)}">안전거래</a>
                        </li>
                        <li th:class="${cate1 == '12' ? 'on' : ''}">
                            <a th:href="@{/cs/notice/list(cate1=12)}">위해상품</a>
                        </li>
                        <li th:class="${cate1 == '13' ? 'on' : ''}">
                            <a th:href="@{/cs/notice/list(cate1=13)}">이벤트당첨</a>
                        </li>
                    </ul>
                </aside> --%>
  
  <!-- CS aside End -->
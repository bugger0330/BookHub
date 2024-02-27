<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- CS aside Start -->
  
<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <span class="fs-4">대분류</span>
    </a>
    <hr>
    <!-- 대분류 목록 출력 -->
    <c:forEach var="cate1" items="${cate1list}">
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <!-- 대분류를 선택할 때마다 해당 대분류의 ID를 cate1 파라미터로 전달하여 페이지를 새로고침 -->
                <a href="/layout/aside?cate1=${cate1.cate1}" class="nav-link">${cate1.c1Name}</a>
            </li>
        </ul>
    </c:forEach>
    <!-- 소분류 목록 출력 -->
    <c:forEach var="cate2" items="${cate2list}">
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="#" class="nav-link active" aria-current="page">${cate2.c2Name}</a>
            </li>
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
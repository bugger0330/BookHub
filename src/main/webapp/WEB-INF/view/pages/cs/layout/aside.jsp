<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
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
=======
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- CS aside Start -->

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
	<a href="/"
		class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
		<span class="fs-4">열린공간</span>
	</a>

	<div class="main-cate1">
		<div class="cate-header">
			<span class="cate1-title">고객서비스</span>
		</div>
		<div class="cate-child">
			<span>안내</span> <span>서비스</span> <span>주의</span>
		</div>
	</div>

	<hr>
</div>

<!-- CS aside End -->
<script>
const innerBody = document.querySelector(".main-cate1");


load();

function load(){
    $.ajax({
        type : "get",
        url : "/category",
        success : function(data){
            if(data != ""){
                innerFun(data);
            }
        },
        error : function(){
            alert("에러");
        }
    });
}

function innerFun(data){
    let innr = "";
    for(let i = 0; i < data.length; i++){
        innr += 
            <div class="cate-header">
                <span class="cate1-title">${data[i].c1Name}</span>
            </div>
            <div class="cate-child"></div>
        ;
    }
    innerBody.innerHTML = innr;

    const cChild = document.querySelectorAll(".cate-child");
    for(let k = 0; k < data.length; k++){
        let innr2 = "";
        for(let g = 0; g < data[k].respList.length; g++){
            console.log("dddddd2", data[k].respList[g]);
            innr2 += 
                <span>${data[k].respList[g].c2Name}</span>
            ;
        }// for(let g
        cChild[k].innerHTML = innr2;
    }// for(let k

    for(let i = 0; i < cChild.length; i++){
        cChild[i].style.display = "none";
    }
    const cHeader = document.querySelectorAll(".cate-header");
    for(let i = 0; i < cHeader.length; i++){
        cHeader[i].onclick = () => {
            if(cChild[i].style.display == "none"){
            cChild[i].style.display = "flex";
            }else{
                cChild[i].style.display = "none";
            }
        }
    }
}
</script>
>>>>>>> 52b11f096ae75444a26f841dd3900f1238d37f59

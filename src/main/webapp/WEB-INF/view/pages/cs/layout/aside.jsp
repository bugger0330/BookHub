<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- CS aside Start -->
  
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<span class="fs-4">열린공간</span>
		</a>
		
		<c:forEach var="list" items="${cate1list}">
		<ul id="category1" class="nav nav-pills flex-column mb-auto">
			<li><a href="/board/subcategories?cate1=10" class="nav-link link-dark" data-value="10"> ${list.c1Name} </a></li>
			<li><a href="/board/subcategories?cate1=20" class="nav-link link-dark" data-value="20"> 편의시설 </a></li>
			<li><a href="/board/subcategories?cate1=30" class="nav-link link-dark" data-value="30"> 구독요금제 </a></li>
			<li><a href="/board/subcategories?cate1=40" class="nav-link link-dark" id="etc" value="40"> 기타 </a></li>
			<li class="nav-item"><a  id="category2" href="/board/subcategories?cate1=50" class="nav-link active" aria-current="page" data-value="50"> 고객서비스 </a></li>
		</ul>
		</c:forEach>
		<hr>
	</div>
  
  <!-- CS aside End -->
  
  <script>
    $(document).ready(function() {
    	
        console.log('이벤트 감지')
        
        
        $("#category1 li").click(function(event) {
        
        	event.preventDefault();

        
        	   // Retrieve data-value attribute value from the clicked element
            var selectedCategory1Id = $(this).find("a").data("value");
            
            // Log the value to the console
            console.log('Selected Category1 Id:', selectedCategory1Id);
        	
        	
        	
        	
        	
        	

        	
            $.ajax({
                url: "/board/subcategories?cate1=" + selectedCategory1Id,
                type: "GET",
                
                success: function(data) {
                    // 받아온 데이터로 2차 카테고리 목록을 업데이트
                    console.log('석세스 탐지 완료')
                    $("#category2").empty();
                    $.each(data, function(index, category2) {
                        $("#category2").append("<option value='" + category2.id + "'>" + category2.name + "</option>");
                    });
                },
                error: function() {
                    console.error("Failed to fetch subcategories.");
                }
            });
        });
    });
</script>
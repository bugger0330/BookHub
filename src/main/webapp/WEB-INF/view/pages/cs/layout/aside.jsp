<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  <!-- CS aside Start -->
  
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<span class="fs-4">열린공간</span>
		</a>
		
		<ul id="category1" class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> 고객서비스 </a></li>
			<li><a href="/board/subcategories/10" class="nav-link link-dark"> 독서모임 </a></li>
			<li><a href="/board/subcategories/20" class="nav-link link-dark"> 편의시설 </a></li>
			<li><a href="/board/subcategories/30" class="nav-link link-dark"> 구독요금제 </a></li>
			<li><a href="/board/subcategories/40" class="nav-link link-dark"> 기타 </a></li>
		</ul>
		
		<hr>
	</div>
  
  <!-- CS aside End -->
  
  <script>
    $(document).ready(function() {
        // 1차 카테고리가 변경될 때 AJAX 요청을 보내어 2차 카테고리를 동적으로 로드
        $("#category1").change(function() {
            var selectedCategory1Id = $(this).val();
            $.ajax({
                url: "/board/subcategories?cate1=" + selectedCategory1Id,
                type: "GET",
                success: function(data) {
                    // 받아온 데이터로 2차 카테고리 목록을 업데이트
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
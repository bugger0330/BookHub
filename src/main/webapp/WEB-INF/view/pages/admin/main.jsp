<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
    <!-- Header Start -->
    	<div class="container-fluid bg-dark py-5 mb-5 page-header">
    		<div class="container py-5">
    			<div class="row justify-content-center">
    				<div class="col-lg-10 text-center">
    					<h3 class="display-5 text-white animated slideInDown">관리자페이지</h3>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- Header End -->
<!-- Page Content-->
<div class="container px-4 px-lg-5">
	<!-- Heading Row-->
	<!-- 전체 회원수를 숫자로 표시 -->
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-md-6 mx-auto">
			<div class="card bg-dark text-white shadow rounded-3 py-5">
				<div class="card-body">
					<h2 class="fs-4 fw-bold">📚BookHub 전체 회원 수</h2>
					<h1 class="display-5" id="totalUsersText">Loading...</h1>

					<!-- 회원 관리 바로 가기 버튼 -->
					<a href="user/list" class="btn btn-primary btn-sm mt-3"
						style="position: absolute; bottom: 10px; right: 10px; padding: 10px;">회원
						관리 바로 가기</a>
				</div>


			</div>
		</div>
		<div class="col-md-6 mx-auto">
			<div class="card bg-dark text-white shadow rounded-3 py-5">
				<div class="card-body">
					<h2 class="fs-4 fw-bold">📚BookHub 배너 광고 수</h2>
					<h1 class="display-5" id="totalAdsText">Loading...</h1>

					<!-- 회원 관리 바로 가기 버튼 -->
					<a href="ad/list"
						class="btn btn-primary btn-sm mt-3"
						style="position: absolute; bottom: 10px; right: 10px; padding: 10px;">광고
						관리 바로 가기</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Call to Action-->
<div class="row gx-4 gx-lg-5 align-items-center my-5">
    <div class="col-md-12 mx-auto"> <!-- 중간(md) 화면에서 8개의 열을 차지 -->
        <div class="card bg-dark text-white shadow rounded-3 py-5">
            <div class="card-body">
                <h2 class="fs-4 fw-bold">📚BookHub 포인트 거래 수익</h2>
                <h1 class="display-5" id="totalPointText">Loading...</h1>

                
            </div>
        </div>
    </div>
</div>

<div class="row gx-4 gx-lg-5 align-items-center my-5">
    <div class="col-md-12 mx-auto"> <!-- 중간(md) 화면에서 8개의 열을 차지 -->
        <div class="card bg-dark text-white shadow rounded-3 py-5">
            <div class="card-body">
                <h2 class="fs-4 fw-bold">📚BookHub 배너광고수익</h2>
                <h1 class="display-5" id="totalPriceText">Loading...</h1>

                
            </div>
        </div>
    </div>
</div>



</div>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url : "/totaluser",
			type : "GET",
			success : function(data) {
				$('#totalUsersText').text(data + "명");
			},
			error : function(xhr, status, error) {
				console.error("Error fetching total users:", error);
			}
		});
		
		$.ajax({
			url : "/totalad",
			type : "GET",
			success : function(data) {
				$('#totalAdsText').text(data + "개");
			},
			error : function(xhr, status, error) {
				console.error("Error fetching total ads:", error);
			}
		});
		
		
		$.ajax({
		    url: "/user-point/getprice",
		    type: "GET",
		    success: function(data) {
		        // data가 null이면 0으로 설정
		        data = data || 0;
		        // 금액을 '#,###' 형식으로 변환하여 표시
		        let formattedAmount = numberWithCommas(data);
		        $('#totalPointText').text(formattedAmount + "원");
		    },
		    error: function(xhr, status, error) {
		        console.error("Error fetching total ads:", error);
		    }
		});
		
		
		$.ajax({
		    url: "/getPrice",
		    type: "GET",
		    success: function(data) {
		        // data가 null이면 0으로 설정
		        data = data || 0;
		        // 금액을 '#,###' 형식으로 변환하여 표시
		        let formattedAmount = numberWithCommas(data);
		        $('#totalPriceText').text(formattedAmount + "원");
		    },
		    error: function(xhr, status, error) {
		        console.error("Error fetching total ads:", error);
		    }
		});


		// 숫자를 '#,###' 형식으로 변환하는 함수
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

	});

	
</script>
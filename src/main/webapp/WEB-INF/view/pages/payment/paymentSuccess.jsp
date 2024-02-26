<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <title>BookHub :: 독서와 무제한으로 친해지기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">
<head>
<meta charset="UTF-8">
<title>BookHub :: 독서와 무제한 친해지기</title>
</head>
<body>


	<!-- Header Start -->
	<div class="container-fluid bg-dark py-5 mb-5 ">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">결제성공</h3>

				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	
	
     <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				
	<div class="container rounded-3  border-secondary p-3 mb-3">
				<h3>결제에 성공하였습니다.</h3>
				
				<h4>구매내역은 마이페이지에서 확인가능합니다.</h4>
			</div>

		

    </div>
	


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            // 페이지 로드 시 자동으로 실행되는 함수
            $(function() {
                // 사용자 이름 가져오기
                var username = document.getElementById('username').getAttribute('data-username');
                console.log(username);
                var startDate = new Date();
                var endDate = new Date();
                var purchaseDate = new Date();
    
                // 구독 기간 설정 (period는 기간을 나타내는 값으로 가정)
                var period = parseInt("${product.period}");
                endDate.setDate(endDate.getDate() + period); // endDate에 period일을 더함
    
                // 구독 정보 생성
                var userSubscription = {
                    userId: username,
                    subscriptionProductId: "${product.spId}",
                    period: period,
                    purchaseDate: purchaseDate.toISOString(),
                    startDate: startDate.toISOString(),
                    endDate: endDate.toISOString()
                };
    
                // AJAX 요청 설정
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/subscriptions/save",
                    data: JSON.stringify(userSubscription),
                    success: function(response) {
                        // 성공적으로 저장되었을 때 실행할 코드
                        alert("구독 정보가 성공적으로 저장되었습니다.");
                    },
                    error: function(xhr, status, error) {
                        // 저장 중 오류 발생 시 실행할 코드
                        alert("오류가 발생하였습니다. 다시 시도해주세요.");
                    }
                });
            });
        });
    </script>
    

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품 업로드</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-header {
            background-color: #343a40;
            color: white;
        }
        .btn-submit {
            width: 100%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
    <!-- Header Start -->
    	<div class="container-fluid bg-dark py-5 mb-5 page-header">
    		<div class="container py-5">
    			<div class="row justify-content-center">
    				<div class="col-lg-10 text-center">
    					<h3 class="display-5 text-white animated slideInDown">구독상품 추가</h3>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- Header End -->
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-dark text-white">상품 업로드</div>
                    <div class="card-body">
                        <form action="/sc-product/upload" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="title">상품명</label>
                                <input type="text" class="form-control" id="prodName" name="prodName" required>
                            </div>
                            <div class="form-group">
                                <label for="content">금액</label>
                                <input class="form-control" id="price" name="price" rows="3"  required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="advertiser">기간</label>
                                <input type="text" class="form-control" id="period" name="period" required>
                            </div>
                           
                           
                            <button type="submit" class="btn btn-primary btn-submit">업로드</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
   <script>
       $(document).ready(function() {
           // 숫자 입력 필드에서 정수만 입력되도록 유효성 검사
           $('#price, #period').on('input', function() {
               var input = $(this).val();
               if (!/^\d*$/.test(input)) {
                   // 입력값이 숫자가 아닌 경우
                   $(this).addClass('is-invalid');
               } else {
                   $(this).removeClass('is-invalid');
               }
           });

           // 폼 제출 시 숫자가 아닌 값이 입력되었는지 확인하고 얼럿 창 표시
           $('form').submit(function(event) {
               var invalidInputs = $(this).find('.is-invalid');
               if (invalidInputs.length > 0) {
                   event.preventDefault(); // 폼 제출 취소
                   alert('금액 또는 기간 입력창에는 숫자만 입력가능합니다.');
               }
           });
       });
       
       
   </script>



</body>
</html>

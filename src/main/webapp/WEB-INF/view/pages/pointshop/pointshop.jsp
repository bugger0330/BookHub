<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트샵</title>
 <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.card-img {
    width: 100%;
    height: auto;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10 text-center">
                <h3 class="display-5 text-white animated slideInDown">포인트
                    구매하기</h3>
            </div>
        </div>
    </div>
</div>
<!-- Header End -->

<div class="text-center wow fadeInUp mb-5" data-wow-delay="0.1s">
    <h6 class="section-title bg-white text-center text-primary px-3">Point Shop</h6>
    <h1 class="mb-3">BookHub 포인트 상품</h1>
    <h5>BookHub 포인트를 구매하시고, BookHub 기능을 이용하세요!</h5>

   
</div>

<div id="productList" class="container wow fadeInUp">
    <div class="row">
        <!-- 포인트 상품 목록이 동적으로 추가됩니다 -->
    </div>
</div>






<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
$(document).ready(function() {
    $.ajax({
        url: '/point-shop/list',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.length > 0) {
                var productList = '';
                $.each(data, function(index, item) {
                    productList += '<div class="col-md-4">';
                    productList += '<div class="card mb-3">';
                    productList += '<div class="card-body">';
                    productList += '<h5 class="card-title">' + item.prodName + '</h5>';
                    productList += '<p class="card-text">' + item.price + '원</p>';
                    productList += '<sec:authorize access="isAnonymous()">';
                    productList += '<a href="/login"><button class="btn btn-primary purchase-btn">로그인 후 구매하기</button></a>';
                    productList += '</sec:authorize>';
                    productList += '<sec:authorize access="isAuthenticated()">';
                    productList += '<a href="/point-shop/detail/' + item.id + '"><button class="btn btn-primary purchase-btn">구매하기</button></a>';
                    productList += '</sec:authorize>';
                    productList += '</div>';
                    productList += '</div>';
                    productList += '</div>';
                });
                $('#productList .row').html(productList);
            } else {
                $('#productList .row').html('<p>No products found</p>');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log('Error: ', textStatus, errorThrown);
        }
    });

    // 구매하기 버튼 클릭 이벤트 핸들러
    $(document).on('click', '.purchase-btn', function() {
        var productId = $(this).data('product-id');
        console.log('구매하기 버튼 클릭 - 상품 ID:', productId);
        // 여기에서 해당 상품을 구매하는 로직을 처리할 수 있습니다.
        window.location.href = '/point-shop/detail?id=' + productId;
    });
});

</script>

</body>
</html>

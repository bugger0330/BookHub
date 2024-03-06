<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
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
                <h3 class="display-5 text-white animated slideInDown">상품 수정</h3>
            </div>
        </div>
    </div>
</div>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-dark text-white">상품 정보 수정</div>
                <div class="card-body">
                    <form action="/point-shop/edit/${point.id}" id="edit-btn-form" method="post" >
                        <input type="hidden" name="_method" value="put" />
                        <input type="hidden" name="id" value="${point.id}" />

                        <div class="form-group">
                            <label for="prodName">상품명</label>
                            <input type="text" class="form-control" id="prodName" name="prodName" value="${point.prodName}" required>
                            <div id="titleFeedback" class="invalid-feedback"></div>
                        </div>

                      
                        <div class="form-group">
                            <label for="name">포인트</label>
                            <input type="text" class="form-control" id="point" name="point" value="${point.point}" required>
                        </div>
                       

                        <div class="form-group">
                            <label for="name">가격</label>
                            <input type="text" class="form-control" id="price" name="price" value="${point.price}" required>
                        </div>

                        <button type="button" class="btn btn-primary btn-submit mb-3" id="editBtn">수정하기</button>
                    </form>

                    <form id="delete-btn-form" action="/point-shop/delete/${point.id}" method="post">
                        <input type="hidden" name="_method" value="delete" />
                        <button type="button" class="btn btn-danger btn-submit" id="deleteBtn">상품삭제</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
<script src="/js/admin/userPointProductBuyDetail.js"></script>

</body>
</html>

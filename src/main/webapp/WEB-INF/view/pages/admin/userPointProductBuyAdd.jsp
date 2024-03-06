<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>포인트 상품 추가하기</title>
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
        .invalid-input {
            border: 1px solid red !important;
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
                    <h3 class="display-5 text-white animated slideInDown">포인트상품 등록</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-dark text-white">상품 등록</div>
                    <div class="card-body">
                        <form action="/point-shop/upload" method="post" enctype="multipart/form-data" id="productUploadForm">
                            <div class="form-group">
                                <label for="title">상품명</label>
                                <input type="text" class="form-control" id="prodName" name="prodName" required>
                            </div>
                                                      <div class="form-group">
                                <label for="point">포인트</label>
                                <input type="text" class="form-control point" id="point" name="point" required>
                            </div>
                                      <div class="form-group">
                                <label for="point">가격</label>
                                <input type="text" class="form-control point" id="price" name="price" required>
                            </div>
                            
                            
                            <button type="submit" class="btn btn-primary btn-submit">등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
    <script src="/js/admin/userPointProductBuyAdd.js"></script>
   
</body>
</html>

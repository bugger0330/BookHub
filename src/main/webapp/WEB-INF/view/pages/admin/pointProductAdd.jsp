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
                        <form action="/point-product/upload" method="post" enctype="multipart/form-data" id="productUploadForm">
                            <div class="form-group">
                                <label for="title">상품명</label>
                                <input type="text" class="form-control" id="prodName" name="prodName" required>
                            </div>
                            <div class="form-group">
                                <label for="content">가격</label>
                                <input class="form-control price" id="price" name="price" rows="3" required></input>
                            </div>
                            <div class="form-group">
                                <label for="point">포인트</label>
                                <input type="text" class="form-control point" id="point" name="point" required>
                            </div>
                            <div class="form-group">
                                <label for="file">파일 업로드</label>
                                <input type="file" class="form-control" id="file" name="productImage" accept=".jpg, .jpeg, .png, .gif" required>
                            </div>
                            <div class="form-group">
                                <label>판매 여부</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="postYn" id="postYn" value="Y" checked>
                                    <label class="form-check-label" for="displayYes">판매</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="postYn" id="postYn" value="N">
                                    <label class="form-check-label" for="displayNo">미판매</label>
                                </div>
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
            // 입력창에 숫자 입력 시 #,### 형식으로 변경
            $('.price, .point').on('input', function() {
                var num = $(this).val().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                $(this).val(num);
            });

            // 폼 제출 시 쉼표(,) 제거
            $('#productUploadForm').submit(function() {
                $('.price, .point').each(function() {
                    var num = $(this).val().replace(/\D/g, "");
                    $(this).val(num);
                });
            });
        });
    </script>
</body>
</html>

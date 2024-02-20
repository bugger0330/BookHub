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
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-dark text-white">상품 업로드</div>
                    <div class="card-body">
                        <form action="/product-upload" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="title">상품명</label>
                                <input type="text" class="form-control" id="prodName" name="prodName" required>
                            </div>
                            <div class="form-group">
                                <label for="content">금액</label>
                                <textarea class="form-control" id="price" name="price" rows="3"  required></textarea>
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
        // JavaScript 코드를 추가할 수 있습니다.
    </script>
</body>
</html>

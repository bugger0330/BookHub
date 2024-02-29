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
                    <form action="/point-product/edit/${product.id}" id="edit-btn-form" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_method" value="put" />
                        <input type="hidden" name="id" value="${product.id}" />

                        <div class="form-group">
                            <label for="prodName">제목</label>
                            <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" required>
                            <div id="titleFeedback" class="invalid-feedback"></div>
                        </div>

                      
                        <div class="form-group">
                            <label for="name">포인트</label>
                            <input type="text" class="form-control" id="point" name="point" value="${product.point}" required>
                        </div>
                        <div class="form-group">
                            <label for="bannerImage">이미지 업로드</label>
                            <input type="file" class="form-control" id="productImage" name="productImage">
                            <div class="card mt-3">
                                <div class="card-header bg-warning">현재 이미지</div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img src="/images/upload/${product.uploadFileName}" style="width:70%; height:70%;">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>판매여부</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="postYn" id="Y" value="Y" <c:if test="${product.postYn == 'Y'}">checked</c:if>> <label class="form-check-label" for="Y">판매</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="postYn" id="N" value="N" <c:if test="${product.postYn == 'N'}">checked</c:if>> <label class="form-check-label" for="N">판매중단</label>
                            </div>
                        </div>

                        <button type="button" class="btn btn-primary btn-submit mb-3" id="editBtn">수정하기</button>
                    </form>

                    <form id="delete-btn-form" action="/point-product/delete/${product.id}" method="post">
                        <input type="hidden" name="_method" value="delete" />
                        <button type="button" class="btn btn-danger btn-submit" id="deleteBtn">상품삭제</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
<script src="/js/admin/pointProductUpdate.js"></script>
<!-- <script>
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn").click(function() {
        if (confirm("수정하시겠습니까?")) {
        	
            $("#edit-btn-form").submit();
            
        }
    });

    // 삭제 버튼 클릭 시
    $("#deleteBtn").click(function() {
        if (confirm("삭제하시겠습니까?")) {
        	
            $("#delete-btn-form").submit();
          
        }
    });
    
    
    

    // 폼 유효성 검사 및 숫자만 입력 체크
    $("#edit-btn-form").submit(function() {
        var price = $("#price").val();
        var point = $("#point").val();

        if (isNaN(price) || isNaN(point)) {
            alert("가격과 포인트는 숫자만 입력해주세요.");
            return false;
        }

        // 이미지 업로드 체크
        var fileInput = $("#productImage");
        if (fileInput.val() === "") {
            alert("이미지를 업로드해주세요.");
            return false;
        }

        return true;
    });
});
</script>
 -->
</body>
</html>

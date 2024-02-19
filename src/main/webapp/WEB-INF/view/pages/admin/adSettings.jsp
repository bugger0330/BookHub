<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>광고 업로드</title>
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
                    <div class="card-header bg-dark text-white">광고 업로드</div>
                    <div class="card-body">
                        <form action="/ad/upload" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="content">내용(url)</label>
                                <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="advertiser">광고주명</label>
                                <input type="text" class="form-control" id="advertiser" name="writer" required>
                            </div>
                            <div class="form-group">
                                <label for="file">파일 업로드</label>
                                <input type="file" class="form-control" id="file" name="bannerImage" accept=".jpg, .jpeg, .png, .gif" required>
                            </div>
                            <div class="form-group">
                                <label>광고 표시 여부</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="postYn" id="displayYes" value="Y" checked>
                                    <label class="form-check-label" for="displayYes">광고 표시</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="postYn" id="displayNo" value="N">
                                    <label class="form-check-label" for="displayNo">광고 미표시</label>
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
        // JavaScript 코드를 추가할 수 있습니다.
    </script>
</body>
</html>

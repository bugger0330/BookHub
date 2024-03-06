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
        #preview-image {
            max-width: 100%;
            max-height: 200px;
            margin-top: 10px;
            display: none; /* 이미지 미리보기를 기본적으로 숨김 */
        }
        #preview-label {
            display: none; /* 미리보기 텍스트를 기본적으로 숨김 */
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
                    <h3 class="display-5 text-white animated slideInDown">배너광고 업로드</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-dark text-white">광고 업로드</div>
                    <div class="card-body">
                        <form id="uploadForm" action="/ad/upload" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="content">URL</label>
                                <textarea class="form-control" id="content" name="content" rows="3"  placeholder="https://" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="advertiser">광고주명</label>
                                <input type="text" class="form-control" id="advertiser" name="writer" required>
                            </div>
                            <div class="form-group">
                                <label for="file">파일 업로드</label>
                                <input type="file" class="form-control" id="file" name="bannerImage" accept=".jpg, .jpeg, .png, .gif" required>
                                <img id="preview-image" src="#" alt="미리보기"> <!-- 이미지 미리보기를 위한 img 요소 -->
                                <label id="preview-label" for="file">이미지 미리보기</label> <!-- 이미지 미리보기 텍스트 -->
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
        $(document).ready(function() {
            // 파일 입력 변경 이벤트 핸들러
            $('#file').change(function() {
                // 파일이 선택되었는지 확인
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#preview-image').attr('src', e.target.result); // 이미지 미리보기 업데이트
                        $('#preview-image').show(); // 이미지 미리보기를 보이도록 설정
                        $('#preview-label').hide(); // 미리보기 텍스트를 숨김
                    }
                    reader.readAsDataURL(this.files[0]); // 파일을 읽어서 데이터 URL로 변환하여 이미지 미리보기에 삽입
                }
            });
        });
    </script>
</body>
</html>

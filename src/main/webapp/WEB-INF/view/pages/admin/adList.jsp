<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>광고 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            border-radius: 20px;
            overflow: hidden;

        }

        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .pagination {
            margin-top: 20px;
        }

        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <!-- Header Start -->
    <div class="container-fluid bg-dark py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h3 class="display-5 text-white animated slideInDown">광고 목록</h3>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <table class="table table-hover table-light">
            <thead class="table-dark">
                <tr class="text-center">
                    <th>순번</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>광고주명</th>
                    <th>이미지</th>
                    <th>광고시작여부</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ad" items="${adList}">
                    <tr>
                        <td class="text-center">${ad.id}</td>
                        <td class="text-center">${ad.title}</td>
                        <td class="text-center">${ad.content}</td>
                        <td class="text-center">${ad.writer}</td>
                        <td class="text-center"><img src="${ad.setupAdImage()}" width="200" height="100"></td>
                        <td class="text-center">${ad.postYn == 'Y' ? '광고중' : '광고중단'}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 처리 -->
        <div class="pagination justify-content-center mb-5">
            <c:if test="${page > 1}">
                <a href="?page=1&size=${size}">&laquo; 첫 페이지</a>
                <a href="?page=${page - 1}&size=${size}">&laquo; 이전</a>
            </c:if>
            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                <c:choose>
                    <c:when test="${i eq page}">
                        <a href="?page=${i}&size=${size}" class="active">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${i}&size=${size}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${page < totalPages}">
                <a href="?page=${page + 1}&size=${size}">다음 &raquo;</a>
                <a href="?page=${totalPages}&size=${size}">마지막 페이지 &raquo;</a>
            </c:if>
        </div>
    </div>
<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.dropdown-toggle').dropdown();
        });
    </script>
</body>
</html>

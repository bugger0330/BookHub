<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전체회원조회</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>
<body>
<div id="container">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">전체회원조회</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="/admin">메인화면</a></li>
                <li class="breadcrumb-item active">전체회원조회</li>
            </ol>
            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>성별</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>유형</th>
                                <th>포인트</th>
                                <th>우편번호</th>
                                <th>주소1</th>
                                <th>주소2</th>
                                <th>상태</th>
                                <th>가입일</th>
                                <th>최종접속일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.gender}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.email}</td>
                                    <td>${user.type}</td>
                                    <td>${user.point}</td>
                                    <td>${user.zip}</td>
                                    <td>${user.addr1}</td>
                                    <td>${user.addr2}</td>
                                    <td>${user.status}</td>
                                    <td>${user.wdate}</td>
                                    <td>${user.rdate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright &copy; Your Website 2023</div>
                <div>
                    <a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp;
                        Conditions</a>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>
</html>

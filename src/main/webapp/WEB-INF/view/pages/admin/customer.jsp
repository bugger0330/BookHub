<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>

<div class="container">
    <h1>회원전체조회</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>순서</th>
                    <th>UserName</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Point</th>
                    <th>주소</th>
                    <th>가입일</th>
                    <th>최종로그인</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <!-- 여기에 사용자 정보가 자바스크립트로 삽입됩니다. -->
            </tbody>
        </table>
    </div>
</div>


<script type="text/javascript">
    // JSON 데이터를 받아와서 화면에 출력하는 함수
    function displayUsers(users) {
        var tableBody = document.getElementById("userTableBody");

        if (users.length === 0) {
            var row = "<tr><td colspan='12'>회원 정보가 없습니다.</td></tr>";
            tableBody.innerHTML = row;
            return;
        }

        for (var i = 0; i < users.length; i++) {
            var user = users[i];
            var row = "<tr>" +
                      "<td>" + (i + 1) + "</td>" + // 순서
                      "<td>" + user.userName + "</td>" +
                      "<td>" + user.name + "</td>" +
                      "<td>" + (user.gender === 1 ? 'Male' : 'Female') + "</td>" +
                      "<td>" + user.phone + "</td>" +
                      "<td>" + user.email + "</td>" +
                      "<td>" + (user.type === 1 ? '일반' : '관리자') + "</td>" +
                      "<td>" + user.point + "</td>" +
                      "<td>" + user.addr1 + " " + user.addr2 + " " + user.zip + "</td>" +
                      "<td>" + user.rdate + "</td>" +
                      "<td>" + user.wdate + "</td>" +
                      "<td>" + (user.status === 0 ? '활성' : '비활성') + "</td>" +
                      "</tr>";
            tableBody.innerHTML += row;
        }
    }

    // AJAX를 사용하여 서버로부터 JSON 데이터를 비동기적으로 가져옴
    function fetchUsers() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var users = JSON.parse(xhr.responseText); // JSON 형식의 응답을 객체로 변환
                    displayUsers(users);
                } else {
                    console.error('서버에서 회원 정보를 가져오는 중 에러가 발생했습니다.');
                }
            }
        };
        xhr.open("GET", "/user/admin/users", true);
        xhr.send();
    }

    // 페이지가 로드될 때 사용자 데이터를 가져옴
    window.onload = fetchUsers;
</script>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

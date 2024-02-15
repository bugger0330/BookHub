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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    // JSON 데이터를 받아와서 화면에 출력하는 함수
    function displayUsers(users) {
        var tableBody = $("#userTableBody");

        if (users.length === 0) {
            var row = "<tr><td colspan='12'>회원 정보가 없습니다.</td></tr>";
            tableBody.html(row);
            return;
        }

        $.each(users, function(i, user) {
            var gender = user.gender === 1 ? 'Male' : 'Female';
            var type = user.type === 1 ? '일반' : '관리자';
            var status = user.status === 0 ? '활성' : '비활성';

            var row = "<tr>" +
                      "<td>" + user.id + "</td>" +
                      "<td>" + user.userName + "</td>" +
                      "<td>" + user.name + "</td>" +
                      "<td>" + gender + "</td>" +
                      "<td>" + user.phone + "</td>" +
                      "<td>" + user.email + "</td>" +
                      "<td>" + type + "</td>" +
                      "<td>" + user.point + "</td>" +
                      "<td>" + user.addr1 + " " + user.addr2 + " " + user.zip + "</td>" +
                      "<td>" + user.rdate + "</td>" +
                      "<td>" + user.wdate + "</td>" +
                      "<td>" + status + "</td>" +
                      "</tr>";
            tableBody.append(row);
        });
    }

    // AJAX를 사용하여 서버로부터 JSON 데이터를 비동기적으로 가져옴
    function fetchUsers() {
        $.ajax({
            url: "/user/admin/users",
            type: "GET",
            success: function(users) {
                displayUsers(users);
            },
            error: function(xhr, status, error) {
                console.error('서버에서 회원 정보를 가져오는 중 에러가 발생했습니다.');
            }
        });
    }

    // 페이지가 로드될 때 사용자 데이터를 가져옴
    $(document).ready(function() {
        fetchUsers();
    });
</script>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

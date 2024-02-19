<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/pages/admin/layout/header.jsp"%>

<!-- Page Content-->
<div class="container px-4 px-lg-5">
    <!-- Heading Row-->
    <!-- 전체 회원수를 숫자로 표시 -->
    <div class="row gx-4 gx-lg-5 align-items-center my-5">
        <div class="col-md-6 mx-auto">
            <div class="card bg-dark text-white shadow rounded-3 py-5">
                <div class="card-body">
                    <h2 class="fs-4 fw-bold">📚BookHub 전체 회원 수</h2>
                    <h1 class="display-5" id="totalUsersText">Loading...</h1>
                </div>
            </div>
        </div>
        <div class="col-md-6 mx-auto">
                    <div class="card bg-dark text-white shadow rounded-3 py-5">
                        <div class="card-body">
                            <h2 class="fs-4 fw-bold">📚BookHub 배너 광고 수</h2>
                            <h1 class="display-5" id="totalAdsText">Loading...</h1>
                        </div>
                    </div>
                </div>
    </div>

    <!-- Call to Action-->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
        <div class="card-body"><p class="text-white m-0">메인화면에 뭐넣지</p></div>
    </div>
    <!-- Content Row-->

</div>

<%@ include file="/WEB-INF/view/pages/admin/layout/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $.ajax({
        url: "/totaluser",
        type: "GET",
        success: function(data) {
            $('#totalUsersText').text(data + "명");
        },
        error: function(xhr, status, error) {
            console.error("Error fetching total users:", error);
        }
    });
});

$(document).ready(function() {
    $.ajax({
        url: "/totalad",
        type: "GET",
        success: function(data) {
            $('#totalAdsText').text(data + "개");
        },
        error: function(xhr, status, error) {
            console.error("Error fetching total ads:", error);
        }
    });
});
</script>

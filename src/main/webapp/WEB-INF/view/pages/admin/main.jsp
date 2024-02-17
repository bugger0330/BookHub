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
        <div class="card-body"><p class="text-white m-0">이 호출 행동 카드는 중요한 정보를 전시하거나 재미있는 태그라인을 표시하는 데 좋은 장소입니다!</p></div>
    </div>
    <!-- Content Row-->
    <div class="row gx-4 gx-lg-5">
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">카드 하나</h2>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 많은 정보</a></div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">카드 둘</h2>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 많은 정보</a></div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">카드 셋</h2>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                </div>
                <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 많은 정보</a></div>
            </div>
        </div>
    </div>
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

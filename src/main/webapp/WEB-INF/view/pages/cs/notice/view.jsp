<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<link href="/css/csStyle.css" rel="stylesheet">
<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">공지사항</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs" class="py-5" style="background-color: #f8f9fa;">
    <div class="container csMainContainer">

        <div class="container">

            <div class="container mt-3">

                <h2 style="margin-bottom: 80px;">공지사항 상세보기</h2>

                <div class="mb-3">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th class="font-weight-bold text-center" style="width: 100px; background-color: #2bc5d4; color: #fff;">Title</th>
                            <td id="title-display" style="text-align: left;"></td>
                        </tr>
                    </table>
                </div>

                <div class="mb-3">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th class="font-weight-bold text-center" style="width: 100px; background-color: #2bc5d4; color: #fff;">Content</th>
                            <td id="content-display" style="text-align: left;"></td>
                        </tr>
                    </table>
                </div>

                <div class="mb-3">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th class="font-weight-bold text-center" style="width: 100px; background-color: #2bc5d4; color: #fff;">File</th>
                            <td id="file-display" style="text-align: left;"></td>
                        </tr>
                    </table>
                </div>

            </div>

            <div>
                <button class="btn btn-secondary rounded-pill shadow-sm" onclick="history.back()" style="float: right; margin-left: 10px;">돌아가기</button>
                <!-- 이부분은 관리자계정으로 로그인시 표시되게 설정해야함 -->
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <button id="btn-delete" class="btn btn-danger rounded-pill shadow-sm" style="float: right;">삭제하기</button>
                </sec:authorize>
            </div>

        </div>

    </div>
</section>



<script src="/js/cs/csNotice.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



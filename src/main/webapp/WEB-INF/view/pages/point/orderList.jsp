<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">Coffie & Bakery</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	<div class="point--order--main-div">
        <div class="point--order--header">
            <span>포인트 사용내역</span>
        </div>
        <div class="point--order--body">
            <div class="point--order--flag-box">
                <div class="point--order--flag">
                    <input type="checkbox" class="point--order--check">
                    <span>환불가능</span>
                </div>
                <div class="point--order--flag">
                    <input type="checkbox" class="point--order--check">
                    <span>환불완료</span>
                </div>
            </div>
            <table class="point--order--table">
                <thead class="point--order--thead">
                    <tr class="point--order--tr">
                        <th class="point--order--th">상품명</th>
                        <th class="point--order--th">개별 포인트</th>
                        <th class="point--order--th">주문수량</th>
                        <th class="point--order--th">총 결제 포인트</th>
                        <th class="point--order--th">주문시각</th>
                        <th class="point--order--th">환불여부</th>
                        <th class="point--order--th">환불</th>
                    </tr>
                </thead>
                <tbody class="point--order--tbody"></tbody>
            </table>
        </div>
    </div>
<script src="/js/point/orderList.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

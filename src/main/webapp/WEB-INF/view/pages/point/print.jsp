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
	<div class="point--print--main-div">
        <div class="point--print--header-div">
            <span class="point--print--header-title">복사 / 프린트</span>
        </div>
        <div class="point--print--body-div">
            <div class="point--print--print-area">
                <div class="point--print--print-item">
                    <div class="point--print--print-title-area">
                        <span>복사</span>
                    </div>
                    <div class="point--print--print-img-area">
                        <img src="/img/point/copy.png" alt="복사기">
                    </div>
                    <div class="point--print--print-select-area">
                        <span>복사 매수</span>
                        <div class="point--print--print-count-area">
                            <input type="number" class="point--print--print-input" value="0">
                            <span>매</span>
                        </div>
                    </div>
                </div>
                <div class="point--print--print-item">
                    <div class="point--print--print-title-area">
                        <span>프린트</span>
                    </div>
                    <div class="point--print--print-img-area">
                        <img src="/img/point/print.jpg" alt="프린트">
                    </div>
                    <div class="point--print--print-select-area">
                        <span>프린트 매수</span>
                        <div class="point--print--print-count-area">
                            <input type="number" class="point--print--print-input" value="0">
                            <span>매</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="point--print--footer-div">
            <div class="point--print--result-area">
                <div class="point--print--result-title">
                    <span>매수 :</span>
                    <span>내 포인트 :</span>
                    <span>결제금액 :</span>
                </div>
                <div class="point--print--result-print">
                    <span class="point--print--count"></span>
                    <div class="point--print--point-div">
                        <span class="point--print--mypoint"></span>
                        <span class="point--print--point-color">P</span>
                    </div>
                    <div class="point--print--point-div">
                        <span class="point--print--allpoint"></span>
                        <span class="point--print--point-color">P</span>
                    </div>
                </div>
            </div>
            <div class="point--print--button-area">
                <button type="button" class="point--print--print-btn">복사기 사용</button>
            </div>
        </div>
    </div>
	
<script src="/js/point/print.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

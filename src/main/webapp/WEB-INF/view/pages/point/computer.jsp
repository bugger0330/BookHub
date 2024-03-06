<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">컴퓨터실</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
    <div class="main-div">
        <div class="header">
            <span>사용하실 컴퓨터를 선택해주세요!</span>
        </div>
        <div class="body">
            <div class="computer-room">
                <div class="computer-table">
                    <div class="room">
                        <span>1</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>2</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>3</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>4</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>5</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>6</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>7</span>
                        <div class="com1"></div>
                    </div>
                    <div class="room">
                        <span>8</span>
                        <div class="com1"></div>
                    </div>
                </div>
                <div class="hr"></div>
                <div class="computer-table">
                    <div class="room">
                        <div class="com1"></div>
                        <span>9</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>10</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>11</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>12</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>13</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>14</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>15</span>
                    </div>
                    <div class="room">
                        <div class="com1"></div>
                        <span>16</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer1">
                <div class="info-box">
                    <div class="memo">
                        <div class="memo-box">
                            <span class="memo-title">주의사항</span>
                        </div>
                        <div class="memo-content-box">
                            <div class="memo1">
                                <div class="memo-div1"></div>
                                <span>사용가능</span>
                            </div>
                            <div class="memo1">
                                <div class="memo-div2"></div>
                                <span>사용불가</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="price-area">
                    <div class="computer-status-div">
                    <div class="inner-flag"></div>
                        <div class="my-area">
                            <div class="my-title">
                                <span>내 포인트 :</span>
                            </div>
                            <div class="my-point">
                                <span class="myp"></span>
                                <span>P</span>
                            </div>
                        </div>
                        <div class="my-area">
                            <div class="my-title">
                                <span>주문 포인트 :</span>
                            </div>
                            <div class="my-point">
                                <span class="order-price"></span>
                                <span>P</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-area">
                <button type="button" class="use-btn">신청하기</button>
            </div>
        </div>
    </div>
<script src="/js/point/computer.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

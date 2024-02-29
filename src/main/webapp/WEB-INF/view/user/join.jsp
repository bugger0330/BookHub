<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
.join-container {
	width: 1000px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.join-container button {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-top: 10px;
	background: #06BBCC;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.terms-list {
	list-style: none;
	margin-top: 20px;
}
.terms-list li {
	position: relative;
	margin-bottom: 50px;
}

.terms-list h5 {
	margin-left: 93px;
}
.terms-list .term-checkbox {
	position: absolute;
	right: 94px;
	top: -2px;
}
.terms-list .box {
	width: 80%;
	height: 200px;
	border: 1px solid #ccc;
	overflow: auto;
	margin: 0 auto;
	padding: 5px;
	box-sizing: border-box;
	word-break: keep-all;
}

.last-checkbox {
	display: block;
	width: 98%;
	text-align: center;
	border-top: 1px solid #ccc;
	padding: 20px;
	box-sizing: border-box;
}
</style>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">이용약관</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<div class="join-container">
		<span>
			Book Hub 회원이 되시면 하나의 회원정보로 도서관통합정보시스템 이용 기관의 
			홈페이지 서비스, 독서모임 시스템 등을 이용할 수 있습니다.
		</span>
		
		<ul class="terms-list">
			<li>
				<h5>북허브 이용약관</h5>
				
				<div class="term-checkbox">
					<input type="checkbox" name="checking1" id="checking1" required>
					<label for="checking1">동의합니다.</label>
				</div>
				<div class="box">
					서문
					1.1 Book Hub 웹 페이지를 이용해 주셔서 감사합니다. 이용자 여러분의 편리한 도서관 관리와 독서 모임 예약을 지원하기 위해 최선을 다하겠습니다.
					1.2 본 이용약관은 Book Hub 웹 페이지 이용 시 이용자와 운영자 간의 권리, 의무, 책임을 규정하는 것을 목적으로 합니다. Book Hub 웹 페이지를 이용함으로써 이용자는 본 약관에 동의하는 것으로 간주됩니다.
					정의
					2.1 "Book Hub"은 도서관 관리 및 독서 모임 예약을 위한 웹 페이지를 가리킵니다.
					2.2 "이용자"는 Book Hub 웹 페이지를 이용하는 모든 개인 또는 단체를 의미합니다.
					서비스 제공
					3.1 Book Hub은 이용자에게 다음과 같은 서비스를 제공합니다:
					도서관 자료 검색 및 대출 기능
					독서 모임 예약 및 관리 기능
					개인 프로필 및 독서 기록 관리 기능
					3.2 Book Hub은 서비스의 지속적인 개선을 위해 노력하며, 필요 시 서비스의 일부 또는 전부를 변경하거나 중단할 수 있습니다.
					이용자의 권리와 의무
					4.1 이용자는 Book Hub을 이용함으로써 다음을 준수해야 합니다:
					본 약관을 준수하고 웹 페이지를 적법하게 이용함
					개인 정보 보호 정책을 준수함
					타인의 권리를 침해하지 않음
					4.2 이용자는 Book Hub을 이용하여 다음과 같은 행위를 해서는 안 됩니다:
					불법적인 목적으로 서비스를 이용함
					타인의 정보를 부정하게 사용함
					서비스의 안정성을 해치는 행위를 함
					책임 제한
					5.1 Book Hub은 서비스 이용으로 발생한 손해에 대해 어떠한 책임도 지지 않습니다.
					5.2 이용자가 제3자에게 서비스 이용으로 인한 손해를 입힌 경우, 이용자는 자신의 책임 하에 그 손해를 배상하여야 합니다.
					저작권
					6.1 Book Hub에 게시된 모든 컨텐츠의 저작권은 Book Hub 또는 해당 저작권 보유자에게 있습니다.
					6.2 이용자는 Book Hub에서 제공하는 서비스를 개인적으로 이용할 수 있으며, 상업적인 목적으로 사용하거나 제3자에게 양도할 수 없습니다.
					분쟁 해결
					7.1 Book Hub 이용과 관련된 분쟁이 발생할 경우, 이용자는 우선적으로 운영자와 협의하여 해결하려 노력해야 합니다.
					7.2 분쟁이 해결되지 않을 경우, 대한민국의 관할 법원을 관할 법원으로 정합니다.
					기타
					8.1 본 약관의 내용은 필요에 따라 변경될 수 있습니다. 변경 사항은 Book Hub 웹 페이지를 통해 공지됩니다.
					8.2 본 약관의 적용 및 해석은 대한민국의 법률에 따라 이루어집니다.
				</div>
			</li>
			<li>
				<h5>개인정보 취급방침</h5>
				
				<div class="term-checkbox">
					<input type="checkbox" name="checking2" id="checking2" required>
					<label for="checking2">동의합니다.</label>
				</div>
				<div class="box">
					수집하는 개인정보 항목
					1.1 Book Hub은 다음과 같은 개인정보를 수집할 수 있습니다:
					회원 가입 시: 아이디, 이메일 주소, 비밀번호, 성별, 전화번호, 주소
					독서 모임 예약 시: 예약자 이름, 연락처, 주소
					개인정보의 수집 및 이용 목적
					2.1 Book Hub은 다음과 같은 목적으로 개인정보를 수집하고 이용합니다:
					서비스 제공을 위한 회원 관리
					독서 모임 예약 및 관리
					개인정보의 보유 및 이용 기간
					3.1 Book Hub은 개인정보를 이용자가 회원 탈퇴를 요청하거나 서비스 제공 목적을 달성한 후에는 즉시 파기합니다.
					3.2 다만, 관련 법령에 따라 보존이 필요한 경우에는 해당 법령에서 정한 기간 동안 보관됩니다.
					개인정보의 제3자 제공
					4.1 Book Hub은 이용자의 개인정보를 본인의 동의 없이 제3자에게 제공하지 않습니다.
					4.2 다만, 다음의 경우에는 제3자에게 개인정보를 제공할 수 있습니다:
					이용자의 동의가 있는 경우
					법령 등에 따라 제공이 요구되는 경우
					개인정보의 안전성 확보 조치
					5.1 Book Hub은 개인정보의 안전한 처리를 위해 다음과 같은 조치를 취합니다:
					개인정보에 대한 접근 제한
					보안 프로그램을 통한 외부 침입 방지
					개인정보 처리 시스템의 암호화
					개인정보의 열람, 수정 및 삭제
					6.1 이용자는 Book Hub에 등록된 자신의 개인정보를 열람, 수정하거나 삭제할 수 있습니다.
					6.2 개인정보 열람, 수정, 삭제 등의 요청은 Book Hub의 개인정보 관리 책임자에게 문의하여야 합니다.
					쿠키 사용에 대한 안내
					7.1 Book Hub은 이용자에게 쿠키를 사용할 수 있으며, 쿠키는 사용자가 웹 페이지를 방문할 때 브라우저에 저장되는 작은 텍스트 파일입니다.
					7.2 쿠키는 사용자의 웹 페이지 사용 경험을 개선하기 위해 사용되며, 사용자가 쿠키 사용에 동의하지 않을 경우 브라우저 설정에서 쿠키를 차단할 수 있습니다.
					개인정보 취급 방침의 변경
					8.1 Book Hub은 개인정보 취급 방침의 내용 추가, 삭제 또는 수정이 있을 경우 해당 내용을 웹 페이지를 통해 공지할 것입니다.
					8.2 이용자는 변경된 개인정보 취급 방침을 수시로 확인하여야 합니다.
					개인정보 관리 책임자
					9.1 Book Hub의 개인정보 관리 책임자는 다음과 같습니다:
					이름: 관리자
					이메일: admin@gmail.com
					연락처: 010-1234-0000
				</div>
			</li>
			<li>
				<h5>위치정보 이용약관</h5>
				
				<div class="term-checkbox">
					<input type="checkbox" name="checking3" id="checking3" required>
					<label for="checking3">동의합니다.</label>
				</div>
				<div class="box">
					목적
					1.1 본 이용약관은 Book Hub에서 제공하는 위치기반 서비스와 관련하여, 위치정보를 수집, 이용, 제공하는 것에 대한 사항을 규정합니다.
					수집하는 위치정보 항목
					2.1 Book Hub은 다음과 같은 위치정보를 수집할 수 있습니다:
					현재 위치 정보 (GPS 또는 Wi-Fi 기반 위치 정보)
					사용자가 검색한 도서관 위치 정보
					독서 모임 예약 시 입력된 위치 정보
					위치정보의 수집 및 이용 목적
					3.1 Book Hub은 다음과 같은 목적으로 위치정보를 수집하고 이용합니다:
					도서관 위치 정보 제공
					독서 모임 예약 시 해당 지역의 도서관 정보 제공
					사용자의 현재 위치를 기반으로 근처 도서관 추천
					위치정보의 제3자 제공
					4.1 Book Hub은 이용자의 동의 없이 수집된 위치정보를 제3자에게 제공하지 않습니다.
					4.2 다만, 다음의 경우에는 제3자에게 위치정보를 제공할 수 있습니다:
					이용자의 동의가 있는 경우
					법령 등에 따라 제공이 요구되는 경우
					위치정보의 보유 및 이용 기간
					5.1 Book Hub은 위치정보를 이용자가 서비스 이용 목적을 달성한 후에는 지체 없이 파기합니다.
					5.2 다만, 관련 법령에 따라 보존이 필요한 경우에는 해당 법령에서 정한 기간 동안 보관됩니다.
					개인정보 관리 책임자
					6.1 Book Hub의 개인정보 관리 책임자는 다음과 같습니다:
					이름: 관리자
					이메일: admin@gmail.com
					연락처: 010-1234-0000
				</div>
			</li>
			<li>
				<h5>전자금융거래 이용약관</h5>
				
				<div class="term-checkbox">
					<input type="checkbox" name="checking4" id="checking4" required>
					<label for="checking4">동의합니다.</label>
				</div>
				<div class="box">
					목적
					1.1 본 이용약관은 Book Hub에서 제공하는 전자금융거래와 관련하여, 사용자와 서비스 제공자 간의 권리와 의무를 명확히 함을 목적으로 합니다.
					정의
					2.1 "전자금융거래"란 Book Hub을 통해 이용자가 포인트 구매 및 정액제 구매 등의 금융거래를 하는 것을 의미합니다.
					서비스 내용
					3.1 Book Hub의 전자금융거래 서비스는 다음과 같은 내용을 포함합니다:
					포인트 구매: 이용자가 포인트를 구매하여 서비스 내에서 사용할 수 있습니다.
					정액제 구매: 이용자가 정해진 요금을 지불하여 일정 기간 동안 특정 서비스를 이용할 수 있습니다.
					이용자의 권리와 의무
					4.1 이용자는 Book Hub을 통해 전자금융거래를 할 경우 다음을 준수하여야 합니다:
					본 약관을 준수함
					전자금융거래 관련 법령 및 규정을 준수함
					서비스 이용 시 발생하는 비용을 지불함
					4.2 이용자는 포인트 구매 또는 정액제 구매를 통해 제공되는 서비스를 합법적인 목적으로만 사용하여야 합니다.
					서비스 이용료 및 결제
					5.1 포인트 구매 및 정액제 구매와 관련된 서비스 이용료는 Book Hub에서 제시하는 방법으로 결제합니다.
					5.2 서비스 이용료는 Book Hub에서 사전에 공지한 요금을 따릅니다.
					서비스 제공자의 책임 제한
					6.1 Book Hub은 이용자가 전자금융거래를 통해 발생하는 손해에 대해 어떠한 책임도 지지 않습니다.
					6.2 이용자가 전자금융거래를 통해 발생한 손해에 대한 책임은 이용자 본인에게 있습니다.
					분쟁 해결
					7.1 전자금융거래와 관련된 분쟁이 발생할 경우, 이용자는 우선적으로 서비스 제공자와 협의하여 해결하려 노력하여야 합니다.
					7.2 분쟁이 해결되지 않을 경우, 대한민국의 관할 법원을 관할 법원으로 정합니다.
				</div>
			</li>
		</ul>
		<div class="last-checkbox">
			<input type="checkbox" name="allChcking" id="all-checking" required>
			<label for="all-checking">모두 동의합니다.</label>
		</div>
		<button type="button">다음</button>
	</div>
</body>
</html>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>


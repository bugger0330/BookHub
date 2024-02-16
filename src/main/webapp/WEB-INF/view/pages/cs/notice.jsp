<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
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
<div class="infodesk">

	<section id="cs">
		<div class="notice">
			<nav>
				<div>
					<p>
						홈<span>></span>공지사항
					</p>
				</div>
			</nav>
			<section class="list">
				<aside>
					<h2>공지사항</h2>
					<ul>
						<li class="on"><a href="#">전체</a></li>
						<li><a href="#">고객서비스</a></li>
						<li><a href="#">안전거래</a></li>
						<li><a href="#">위해상품</a></li>
						<li><a href="#">이벤트당첨</a></li>
					</ul>
				</aside>
				<article>
					<nav>
						<h1>전체</h1>
						<h2>공지사항 전체 내용입니다.</h2>
						<div>
							<form id="formSearch" 
								method="get">
								<input type="hidden" name="seller"
									> <select
									name="searchType">
									<option value="prodName">상품명</option>
									<option value="prodNo">상품코드</option>
									<option value="company">제조사</option>
								</select> <input type="text" name="searchKeyword" />
								<button id="btnSearch">검색</button>
							</form>
						</div>
					</nav>

					<table>
						<tr>
							<td><a href="./view.html">[안내] 해외결제 사칭 문자 주의</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="./view.html">[발표]『G.Live X SK스토아(하남쭈꾸미)』
									이벤트 당첨자</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[안내] 로젠택배 반품/교환 수거지시 지연 안내</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[안내] 해외직구셀러 특별약관 개정</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[안내] 위치정보이용 약관 개정 공지</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[발표]『써모스 상품 구매』 이벤트 당첨자</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">한국소비자원, '22년 OECD 글로벌 제품안전 캠페인</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[점검] G마켓 사이트 이용 일시 중단</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[안내] 구매회원 이용약관 개정</a></td>
							<td>2022.11.21</td>
						</tr>
						<tr>
							<td><a href="#">[안내] 씨티은행 시스템 점검에 따른 계좌, 체크카드결제 서비스 일시
									중단</a></td>
							<td>2022.11.21</td>
						</tr>
					</table>

					<div class="page">
						<a href="#" class="prev">이전</a> <a href="#" class="num on">1</a> <a
							href="#" class="num">2</a> <a href="#" class="num">3</a> <a
							href="#" class="next">다음</a>
					</div>

				</article>
			</section>
		</div>
	</section>
	<!-- Header End -->


	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
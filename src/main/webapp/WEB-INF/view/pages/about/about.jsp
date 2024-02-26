<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<style>
.col-lg-about {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}



</style>
<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">도서관 소개</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<!-- 인사말 Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-5">
					<div class="col-lg-about wow fadeInUp" data-wow-delay="0.3s">
				<h6 class="section-title bg-white text-start text-primary pe-3">Greeting</h6>
				<h1 class="mb-4">인사말</h1>
				<h3>Bookhub 도서관에 오신 것을 환영합니다.</h3>
				<br>
				<h6>2023년 2월 개관한 Bookhub 도서관은 온/오프라인 대표 도서관으로</h6>
				<h6>시민의 창의력과 상상력의 지식놀이터를 구현하고자 건립되었습니다.</h6>
				<br>
				<h6>전국 최초,</h6>
				<h6>도서관통합자료시스템 구축과 공동보존서고 운영으로</h6>
				<h6>도서관 서비스를 선도하고 있는 Bookhub 도서관은</h6>
				<h6>지역도서관의 실태를 조사, 검토, 전달하는 연구도서관이자</h6>
				<h6>지역자료를 수집, 제공, 보존하는 납본 도서관으로</h6>
				<h6>자료의 중심 역할을 수행하고 있습니다.</h6>
				<br>
				<h6>또한, 다양한 자료 확충과 국내외 도서관 협력사업 추진,</h6>
				<h6>비대면 시대 지역도서관의 미래 서비스를 리더하고</h6>
				<h6>시민의 독서생활 향상을 위한 독서문화프로그램을 개발, 운영하는 등</h6>
				<h6>복합문화공간 역할 수행을 위해 최선을 다하고 있습니다.</h6>
				<br>
				<h6>Bookhub 도서관은 시민 여러분의 성장과 발전을 응원합니다.</h6>
				<br>
				<h6>감사합니다.</h6>
			</div>


		</div>
	</div>
</div>
<!-- 인사말 End -->

<!-- Service Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-4">
			<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="service-item text-center pt-3">
					<div class="p-4">
						<i class="fa fa-3x fa-book-open text-primary mb-4"></i>
						<h5 class="mb-3">도서검색</h5>
						<p>
							읽고싶은 책을 검색하여 <br />독서를 시작하세요!
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
				<div class="service-item text-center pt-3">
					<div class="p-4">
						<i class="fa fa-3x fa-people-arrows text-primary mb-4"></i>
						<h5 class="mb-3">독서모임</h5>
						<p>
							다양한 사람들과 <br /> 의견을 나누어보세요!
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
				<div class="service-item text-center pt-3">
					<div class="p-4">
						<i class="fa fa-3x  fa-leaf text-primary mb-4"></i>
						<h5 class="mb-3">도서기부</h5>
						<p>
							도서를 기부하여 <br /> 지구를 지켜주세요!
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
				<div class="service-item text-center pt-3">
					<div class="p-4">
						<i class="fa fa-3x fa-bookmark text-primary mb-4"></i>
						<h5 class="mb-3">BookHub 구독제 운영</h5>
						<p>
							경제적인 가격으로 <br /> BookHub를 구독하세요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Service End -->


<!-- About Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-5">
			<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s"
				style="min-height: 400px;">
				<div class="position-relative h-100">
					<img class="img-fluid position-absolute w-100 h-100"
						src="img/about.jpg" alt="" style="object-fit: cover;">
				</div>
			</div>
			<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
				<h6 class="section-title bg-white text-start text-primary pe-3">About
					Us</h6>
				<h1 class="mb-4">Welcome to BookHub!</h1>
				<p class="mb-4">친환경 도서관 BookHub에 오신것을 환영합니다.</p>
				<p class="mb-4">
					BookHub 회원이 되시면<br /> 도서대출, 독서모임활동, 기부 등 많은 기능을 이용하실 수 있습니다.
				</p>
				<div class="row gy-2 gx-4 mb-4">
					<div class="col-sm-6">
						<p class="mb-0">
							<i class="fa fa-arrow-right text-primary me-2"></i>도서 대출/반납
						</p>
					</div>
					<div class="col-sm-6">
						<p class="mb-0">
							<i class="fa fa-arrow-right text-primary me-2"></i>독서 모임 개설
						</p>
					</div>
					<div class="col-sm-6">
						<p class="mb-0">
							<i class="fa fa-arrow-right text-primary me-2"></i>도서관 자리지정
						</p>
					</div>
					<div class="col-sm-6">
						<p class="mb-0">
							<i class="fa fa-arrow-right text-primary me-2"></i>독서 토론
						</p>
					</div>
					<div class="col-sm-6">
						<p class="mb-0">
							<i class="fa fa-arrow-right text-primary me-2"></i>도서 기부
						</p>
					</div>

				</div>
				<a class="btn btn-primary py-3 px-5 mt-2" href="/login">회원가입하기</a>
			</div>
		</div>
	</div>
</div>
<!-- About End -->

<!-- 지도 Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-5">

			<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
				<h6 class="section-title bg-white text-start text-primary pe-3">Location</h6>
				<h1 class="mb-4">오시는길</h1>
				<p class="mb-4">부산광역시 부산진구 중앙대로 123</p>
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s"
					style="min-height: 400px;">
					<div class="position-relative h-100">
						<div id="map" style="width: 700px; height: 400px;"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 지도 End -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5275edbfc405960aad1f6f12211cdd04"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(35.15959155540864, 129.0601891353033), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(35.15959155540864,
			129.0601891353033);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">BookHub 도서관<br> <a href="https://map.kakao.com/link/to/Bookhub 도서관,35.15959155540864, 129.0601891353033" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(35.15959155540864, 129.0601891353033); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
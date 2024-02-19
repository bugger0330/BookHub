<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<%-- <%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%> --%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://kudos.knu.ac.kr/css/jquery-ui-1.12.0.min.css">

<style>
  body > div.container > ul{
  justify-content: center;
  align-items: center;
  }
  
  body > div.container > div > div{
  justify-content: right;
  align-items: right;
  }
  .bi bi-bell-fill{
  
  }
</style>
<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">문의하기</h3>
			</div>
		</div>
	</div>
</div>
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">Collapsible</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
          Home
        </button>
        <div class="collapse" id="home-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">Overview</a></li>
            <li><a href="#" class="link-dark rounded">Updates</a></li>
            <li><a href="#" class="link-dark rounded">Reports</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          Dashboard
        </button>
        <div class="collapse" id="dashboard-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">Overview</a></li>
            <li><a href="#" class="link-dark rounded">Weekly</a></li>
            <li><a href="#" class="link-dark rounded">Monthly</a></li>
            <li><a href="#" class="link-dark rounded">Annually</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          Orders
        </button>
        <div class="collapse" id="orders-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">New</a></li>
            <li><a href="#" class="link-dark rounded">Processed</a></li>
            <li><a href="#" class="link-dark rounded">Shipped</a></li>
            <li><a href="#" class="link-dark rounded">Returned</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          Account
        </button>
        <div class="collapse" id="account-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">New...</a></li>
            <li><a href="#" class="link-dark rounded">Profile</a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Sign out</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
<div class="container">
<!-- <div id="body_head">
		<h1>문의하기</h1>
	<div class="pnb">
		<ul class="clearfix">
			<li><a href="#pnb_bx" onclick="zoomFont(1);return false;" title="화면크기 확대" class="bi bi-plus"></a></li>
			<li><a href="#pnb_bx" onclick="zoomFont(0);return false;" title="화면크기 기본값" class="bi bi-type"></a></li>
			<li><a href="#pnb_bx" onclick="zoomFont(-1);return false;" title="화면크기 축소" class="bi bi-dash"></a></li>
		</ul>
		<a href="#pnb_bx" onclick="copyUrl();return false;" class="bi bi-paperclip"></a>
		<a href="#pnb_bx" onclick="contentPrint(1);return false;" title="새창을 띄워 화면을 프린트합니다" class="bi bi-printer"></a>
		<a href="javascript:void(0);" onclick="pageShare();" title="SNS 공유하기버튼이 활성화 됩니다." class="bi bi-share"></a>


				<div class="share-sns" style="display:none;">
			
			<a href="javascript:shareKatalk();" class="kakao" style="background-color:#f8e200;"><img src="../img/ico_kakao.png" width="20px" style="margin-bottom:3px;"></a>
			<a href="javascript:share_sns_kakaostore();" class="kakaostory" style="background-color:#f5c500;"><img src="../img/ico_kakaostory.png" width="20px" style="margin-bottom:3px;"></a>
			<a href="javascript:share_sns_facebook();" class="facebook"><i class="fab fa-facebook-f"></i></a>
			<a href="javascript:share_sns_twitter();" class="twitter"><i class="fab fa-twitter"></i></a>
			<a href="javascript:share_sns_naver();" class="blog">b</a>
			
		</div>
	</div>
</div> -->


  <div>
  <h2>문의하기</h2>
  <div class="input-group">
  <div class="form-outline">
    <input type="search" id="form1" class="form-control" placeholder="Search"/>
  </div>
  
  <button type="button" class="btn btn-primary">
    <i class="fas fa-search"></i>
  </button>
  </div>
</div>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>첨부</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><i class="bi bi-megaphone-fill text-danger"  ></i></td>
        <td>설날 중앙도서관 휴관 안내</td>
        <td><i class="bi bi-file-earmark-text-fill"></i></td>
        <td>관리자</td>
        <td>2024-02-01</td>
        <td>144</td>
      </tr>
      <tr>
        <td><i class="bi bi-megaphone-fill text-danger"  ></i></td>
        <td>설날 중앙도서관 휴관 안내</td>
        <td><i class="bi bi-file-earmark-text-fill"></i></td>
        <td>관리자</td>
        <td>2024-02-01</td>
        <td>144</td>
      </tr>
      <tr>
        <td>1</td>
        <td>설날 중앙도서관 휴관 안내</td>
        <td><i class="bi bi-file-earmark-text-fill"></i></td>
        <td>관리자</td>
        <td>2024-02-01</td>
        <td>144</td>
      </tr>
      <tr>
        <td>2</td>
        <td>설날 중앙도서관 휴관 안내</td>
        <td><i class="bi bi-file-earmark-text-fill"></i></td>
        <td>관리자</td>
        <td>2024-02-01</td>
        <td>144</td>
      </tr>
      <tr>
        <td>3</td>
        <td>설날 중앙도서관 휴관 안내</td>
        <td><i class="bi bi-file-earmark-text-fill"></i></td>
        <td>관리자</td>
        <td>2024-02-01</td>
        <td>144</td>
      </tr>
    </tbody>
  </table>
  
  <ul class="qna pagination">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item active"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">Next</a></li>
</ul>
  
</div>
<!-- Header End -->


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



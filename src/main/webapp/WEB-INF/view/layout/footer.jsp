<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Page Title</title>
<link href="/css/chat/chat.css" rel="stylesheet">
</head>

<body>
	<!-- 푸터 Start -->
	<div
		class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h4 class="text-white mb-3">Quick Link</h4>
					<a class="btn btn-link" href="">Book Hub 소개</a> <a
						class="btn btn-link" href="">Contact Us</a> <a
						class="btn btn-link" href="">Privacy Policy</a> <a
						class="btn btn-link" href="">Terms & Condition</a> <a
						class="btn btn-link" href="">FAQs & Help</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4 class="text-white mb-3">Contact</h4>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>부산광역시 부산진구 중앙대로 123
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>051-123-4567
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>bookhub@bookhub.com
					</p>
					<div class="d-flex pt-2">
						<a class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Book Hub</a>, All Right
						Reserved.
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
							Codex</a><br> <br> Distributed By <a class="border-bottom"
							href="https://themewagon.com">ThemeWagon</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<div class="footer-menu">
							<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
								href="">FQAs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 End -->

	<div class="modal-chat">
		<div class="modal_body-chat">
			<div id="main-content" class="container">

				<!-- 채팅 내용 표시 테이블 -->
				<div class="chat">
					<div class="col-md-12">
						<table id="conversation" class="table table-striped table-borderless">
							<thead>
								<tr>
									<th>BookHub chatbot 1.0</th>
								</tr>
							</thead>
							<tbody id="communicate">
							</tbody>
						</table>
					</div>
				</div>
							<!-- 메시지 전송 폼 -->
				<div class="row">
					<div class="col-md-12">
						<form class="form-inline" id="sendMessageForm">
							<div class="form-group d-flex align-items-center">
								<!-- 메시지 입력 필드 -->
								<input type="text" id="msg" class="form-control"
									placeholder="질문을 해주세요!">
								<!-- 메시지 전송 버튼 -->
								<button id="send" class="btn" type="button">
									<i class="bi bi-arrow-up-square-fill"></i>
								</button>
							</div>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- 챗봇 아이콘 -->
	<button class="btn btn-lg btn-primary btn-lg-square btn--chatbot">
		<i class="bi bi-chat-dots-fill"></i>
	</button>

	
	
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- JavaScript code -->

	<!-- <script src="/js/cs/csCate.js"></script> -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src ="js/chat/chat.js"></script>
	

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>

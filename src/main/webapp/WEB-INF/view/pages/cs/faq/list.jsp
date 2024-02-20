<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">자주 묻는 질문</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<section id="cs">

	<div class="qnaMainContainer">

		<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>

		<div class="container">

			<nav
				style="--bs-breadcrumb-divider: url(&amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;#34;);"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">열린공간</a></li>
					<li class="breadcrumb-item active" aria-current="page"
						style="color: #0596a3;">자주 묻는 질문</li>
				</ol>
			</nav>

			<div>
				<h2>자주 묻는 질문</h2>

				<div class="accordion" id="accordionPanelsStayOpenExample" style="margin-top: 30px; margin-bottom: 30px;">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								Accordion Item #1</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body">
								<strong>This is the first item's accordion body.</strong> It is
								shown by default, until the collapse plugin adds the appropriate
								classes that we use to style each element. These classes control
								the overall appearance, as well as the showing and hiding via
								CSS transitions. You can modify any of this with custom CSS or
								overriding our default variables. It's also worth noting that
								just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseTwo"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
								Accordion Item #2</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse">
							<div class="accordion-body">
								<strong>This is the second item's accordion body.</strong> It is
								hidden by default, until the collapse plugin adds the
								appropriate classes that we use to style each element. These
								classes control the overall appearance, as well as the showing
								and hiding via CSS transitions. You can modify any of this with
								custom CSS or overriding our default variables. It's also worth
								noting that just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseThree"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseThree">Accordion
								Item #3</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body">
								<strong>This is the third item's accordion body.</strong> It is
								hidden by default, until the collapse plugin adds the
								appropriate classes that we use to style each element. These
								classes control the overall appearance, as well as the showing
								and hiding via CSS transitions. You can modify any of this with
								custom CSS or overriding our default variables. It's also worth
								noting that just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
				</div>
				
				<ul class="qna pagination" style="display:flex; justify-content: center; align-content: center;">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



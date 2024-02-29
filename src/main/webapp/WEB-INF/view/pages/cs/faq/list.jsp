<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	<div class="csMainContainer">

		<%-- <%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%> --%>

		<div class="container">

			<div>
				<h2>자주 묻는 질문</h2>

				<button id="btn-all-close">FAQ ALL Close</button>
				<br>
				<table
					class="table table-hover">
					<thead class="thead-light text-center">
						<tr>
							<th>No</th>
							<th>FAQ Title</th>
							<th>Category</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody class="text-center">
					<c:forEach var="list" items="${faqList}">
						<tr>
							<td>${list.id}</td>
							<td class="text-left" width="50%">
								<div class="panel-cs-container">
									<p class="panel-cs-title">${list.title}</p>
									<div class="panel-cs-answer">
										<p>${fn:replace(list.content, '\\n', '<br/>')}</p>
									</div>
								</div>
							</td>
							<td>${list.cate2}</td>
							<td>${list.rdate}</td>
						</tr>
						</c:forEach>
						<tr class="info">
							<td colspan=6 class="text-left">더 궁금한 사항은 1:1문의하기를 이용해주세요.</td>
						</tr>
					</tbody>
				</table>

				
			</div>
		</div>
	</div>
</section>

<script src="/js/csScript.js"></script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>



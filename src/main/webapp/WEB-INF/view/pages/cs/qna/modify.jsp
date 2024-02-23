<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<section id="cs">
	<div class="qna">
		<nav>
			<div>
				<p>
					홈<span>></span>문의하기
				</p>
			</div>
		</nav>
		<section class="write">
			<%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>
			<article>
				<textarea id="txtContent" rows="10" cols="100" style="width: 100%;"></textarea>
				<div id="se2_sample" style="margin: 10px 0;">
					<input type="button" onclick="save();" value="본문 내용 가져오기">
				</div>
			</article>
		</section>
	</div>
</section>
<script src="./js/csScript.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
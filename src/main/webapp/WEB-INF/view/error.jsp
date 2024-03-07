<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main-div{
		width: 90%;
		margin: 200px auto;
		display: flex;
		flex-direction:column;
		justify-content: center;
		align-items: center;
	}
	.error-img{
		width: 700px;
		height: 350px;
		margin-bottom: 50px;
	}
	.error-btn{
		padding: 20px;
		border: 1px solid green;
		border-radius: 20px;
		background-color: white;
		color: green;
		cursor: pointer;
		font-size: 25px;
		margin-top: 50px;
	}
	
</style>
</head>
<body>
	<div class="main-div">
		<img alt="error" src="/img/error/404_illust.jpg" class="error-img">
		<h2>죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.</h2>
		<span>페이지의 주소가 잘못 입력되었거나,</span>
		<span>주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</span>
		<button type="button" class="error-btn">메인으로 ▶</button>
	</div>
	<script>
		const errorBtn = document.querySelector(".error-btn");
		errorBtn.onclick = () => {
			location.href = "/";
		}
	</script>
</body>
</html>
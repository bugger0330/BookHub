<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
  </head>

  <body>
    <h2> 결제 실패 </h2>
    <p id="code"></p>
    <p id="message"></p>
  </body>
</html>

<script>
  const urlParams = new URLSearchParams(window.location.search);

  const codeElement = document.getElementById("code");
  const messageElement = document.getElementById("message");

  codeElement.textContent = "에러코드: " + urlParams.get("code");
  messageElement.textContent = "실패 사유: " + urlParams.get("message");
</script>
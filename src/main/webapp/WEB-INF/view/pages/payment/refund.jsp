<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<button onclick="cancelPay()">환불하기</button>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
  function cancelPay() {
    jQuery.ajax({
      // 예: http://www.myservice.com/payments/cancel
      "url": "{환불정보를 수신할 가맹점 서비스 URL}", 
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "57008833-4", // 예: ORD20180131-0000011
        "cancel_request_amount": 1004, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
        // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        "refund_holder": "홍길동", 
        // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        "refund_bank": "88" 
        // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
        "refund_account": "56211105948400" 
      }),
      "dataType": "json"
    });
  }
</script>
</body>
</html>
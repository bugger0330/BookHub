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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script>
    function cancelPay() {
        var token = "ipQe2Y6MGOwusDOos8IG7KyICvl7bR6OSFNUveEOKgLTkAYQV02voGuJMLzDf2gYwZbBwFcVHCmAkYYf"; // 포트원 API 토큰
        var merchantUid = "57008833-4"; // 주문번호
        var cancelAmount = 1004; // 취소금액
        var cancelReason = "테스트 결제 환불"; // 취소사유

        $.ajax({
            url: "https://api.iamport.kr/payments/cancel",
            type: "POST",
            contentType: "application/json",
            headers: {
                Authorization: "Bearer " + token
            },
            data: JSON.stringify({
                merchant_uid: merchantUid,
                cancel_request_amount: cancelAmount,
                reason: cancelReason
            }),
            dataType: "json",
            success: function (response) {
                console.log("환불이 성공적으로 처리되었습니다.", response);
                // 환불이 성공적으로 처리된 경우 추가 작업 수행
            },
            error: function (xhr, status, error) {
                console.error("환불 요청 중 오류가 발생했습니다.", error);
                // 환불 요청이 실패한 경우 추가 처리
            }
        });
    }
</script>

</body>
</html>

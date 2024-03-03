$(document).ready(function() {
    // 페이지 로드 시 액세스 토큰을 받아옴
    $.ajax({
        type: "GET",
        url: "/payment/token",
        success: function(response) {
            console.log(response.response.access_token);
            let accessToken = response.response.access_token; // 받아온 액세스 토큰을 저장

            $(".refund-btn").click(function() {
                let impUid = $(this).data("impuid");
                console.log("결과", impUid);
                let price = $(this).data("price");
                console.log("가격", price);
                let userId = $(this).data("username");
                console.log("유저아이디", userId);
                let point = $(this).data("point");
                console.log("포인트", point);
                let id = $(this).data("id");
                console.log("id", id);

                let cancelRequest = {
                    imp_uid: impUid,
                    amount: price,
                };

                let requestData = {
                    id: id,
                    refundYn: '환불완료'
                };

                console.log(cancelRequest);

                $.ajax({
                    type: "POST",
                    url: "/payment/cancel-payment?impUid=" + impUid + "&price=" + price, // 'impUid'와 'price'를 URL의 쿼리 파라미터에 포함하여 전달
                    contentType: "application/json",
                    data: JSON.stringify(cancelRequest),
                    headers: {
                        "Authorization": accessToken
                    },
                    success: function(response) {
                        // 환불 성공 시 서버에 해당 환불 정보를 전송하여 포인트 차감
                        $.ajax({
                            type: "POST",
                            url: "/user-point/refund-point", // 환불 처리를 위한 엔드포인트
                            contentType: "application/json",
                            data: JSON.stringify({ userId: userId, point: point }), // 사용자 ID와 환불된 포인트 정보 전송
                            success: function(response) {
                                console.log("환불 정보가 성공적으로 처리되었습니다.");

                                // 포인트 차감 후 유저 포인트 업데이트 요청
                                $.ajax({
                                    type: 'PUT',
                                    url: '/user-point/refund',
                                    contentType: 'application/json',
                                    data: JSON.stringify(requestData),
                                    success: function(response) {
                                        location.reload();
                                    },
                                    error: function(xhr, status, error) {
                                        console.error('환불 요청 중 오류가 발생했습니다:', error);
                                    }
                                });
                            },
                            error: function(xhr, status, error) {
                                console.error("환불 정보 처리 중 오류가 발생했습니다.");
                            }
                        });
                        alert("환불이 성공적으로 처리되었습니다.");
                    },
                    error: function(xhr, status, error) {
                        alert("환불 처리 중 오류가 발생했습니다.");
                        // 오류 처리에 따른 동작 추가
                    }
                });
            });
        },
        error: function(xhr, status, error) {
            alert("액세스 토큰을 받아오는 중 오류가 발생했습니다.");
            // 액세스 토큰을 받아오지 못했을 때 처리
        }
    });
});


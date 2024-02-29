let username = document.getElementById('username').value;
let userId = document.getElementById('userid').value;
console.log("유저네임", username);
console.log("유저아이디", userId);
$(document).ready(function() {
    // 첫 번째 AJAX 요청: 사용자 정보 가져오기
    $.ajax({
        url: "/findbyuser/"+ userId,
        type: "GET",
        success: function(data) {
            let genderText = data.gender === 1 ? "남자" : "여자";
            $("#userName").text(data.userName);
            $("#name").text(data.name);
            $("#gender").text(genderText);
            $("#phone").text(data.phone);
            $("#point").text(data.point + ' ' + '포인트');
            $("#rdate").text(data.rdate);
        },
        error: function() {
            console.log("사용자를 찾을 수 없습니다.");
        }
    });

    // 두 번째 AJAX 요청: 사용자 구매 내역 가져오기
    $.ajax({
        url: "/user-point/detail?userId=" + username,
        type: "GET",
        success: function(data) {
            if (data) {
                $("#purchaseDate").text(data.purchaseDate);
                $("#pointName").text(data.pointName);
                $("#id").text(data.id);
                $("#refundYn").text(data.refundYn);
                $("#dataRow").show();
                if (data.refundYn === '환불요청') {
                    $("#refundButton").hide();
                }
            } else {
                $("#noDataMessage").show();
            }
        },
        error: function() {
            console.log("사용자를 찾을 수 없습니다.");
        }
    });

    // 환불 요청 버튼 클릭 시 실행
    $('#refundButton').click(function() {
        var requestData = {
            id: $("#id").text(),
            refundYn: '환불요청'
        };

        $.ajax({
            type: 'PUT',
            url: '/user-point/refund',
            contentType: 'application/json',
            data: JSON.stringify(requestData),
            success: function(response) {
                alert("환불 요청이 성공적으로 처리되었습니다. 관리자 검토 후 환불 처리됩니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error('환불 요청 중 오류가 발생했습니다:', error);
            }
        });
    });
});

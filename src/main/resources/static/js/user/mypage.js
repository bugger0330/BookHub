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
    if (data.length > 0) {
        var tbody = $("table tbody");

        data.forEach(function(item, index) {
            var newRow = $("<tr>").attr("id", "dataRow_" + index);

            newRow.append("<td>" + item.id + "</td>");
            newRow.append("<td>" + item.purchaseDate + "</td>");
            newRow.append("<td>" + item.pointName + "</td>");
            newRow.append("<td>" + item.refundYn + "</td>");

            var refundButton = $("<button>")
                                .addClass("btn btn-primary refundButton")
                                .attr("id", "refundButton_" + index)
                                .text("환불요청");
            if (item.refundYn === '환불요청') {
                refundButton.hide();
            }
            newRow.append($("<td>").append(refundButton));

            tbody.append(newRow);
        });

        $("#noDataMessage").hide();
    } else {
        $("#noDataMessage").show();
    }
},

        error: function() {
            console.log("사용자를 찾을 수 없습니다.");
        }
    });

$(document).on("click", ".refundButton", function() {
    var index = $(this).attr("id").split("_")[1];
    var requestData = {
        id: $("#dataRow_" + index + " td:nth-child(1)").text(),
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

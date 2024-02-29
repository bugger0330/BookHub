// payment_script.js

var IMP = window.IMP;

IMP.init("imp60780607");


function generateMerchantUid() {
	// 랜덤한 10자리 숫자 생성
	return Math.floor(Math.random() * 10000000000).toString();
}

function requestPay(productId) {
	var merchant_uid = generateMerchantUid(); // 랜덤한 merchant_uid 생성
	// payment_script.js에서
	var productName = "BookHub 포인트 " + prodName;
	var amount = price;
	var point = point;
	var usernames = username;
	var product = prodName;


	console.log(username);

	$.ajax({
		url: "/getid/" + usernames,
		type: "GET",
		success: function(response) {
			// 요청이 성공하면 받은 회원 정보를 화면에 표시
			var buyer_name = response.name; // response에서 userName을 가져와서 buyer_name에 대입
			var buyer_email = response.email;
			var buyer_phone = response.phone;
			var buyer_addr1 = response.addr1;
			var buyer_addr2 = response.addr2;
			var buyer_zip = response.zip;

			console.log("buyer_name", buyer_name);
			console.log("buyer_email", buyer_email);
			console.log("buyer_phone", buyer_phone);
			console.log("buyer_addr1", buyer_addr1);
			console.log("buyer_addr2", buyer_addr2);
			console.log("buyer_zip", buyer_zip);

			// 결제 요청 시 productId와 함께 결제 정보에 추가
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: username + "_" + merchant_uid,
				name: productName,
				amount: amount,
				buyer_email: buyer_email,
				buyer_name: buyer_name,
				buyer_tel: buyer_phone,
				buyer_addr: buyer_addr1 + buyer_addr2,
				buyer_postcode: buyer_zip,
				m_redirect_url: "/success"
			}, function(rsp) {
				if (rsp.success) {
					var userData = {
						"userId": username,
						"pointName": product,
						"purchaseDate": new Date().toISOString(),
						"point": point,
						"impUid": rsp.imp_uid,
						"merchantUid": rsp.merchant_uid
					};
					jQuery.ajax({
						url: "/user-point/save",
						method: "POST",
						headers: {
							"Content-Type": "application/json"
						},
						data: JSON.stringify(userData),
					}).done(function(data) {
						// 가맹점 서버 결제 API 성공시 로직
						window.location.href = "/success"
					})
				} else {
					alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				}
			});
		},
		error: function(xhr, status, error) {
			// 요청이 실패하면 에러 메시지 출력
			alert("오류: " + xhr.responseText);
		}
	});
}

// 버튼 클릭 시 모달 창 표시
$(document).ready(function() {
	$("#termsBtn").click(function() {
		$("#termsModal").modal('show');
	});
});

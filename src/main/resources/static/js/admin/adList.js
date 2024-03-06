document.addEventListener("DOMContentLoaded", function() {
    var adRows = document.querySelectorAll("tbody > tr");
    adRows.forEach(function(row) {
        var adId = row.querySelector(".text-center.align-middle").innerText;

        fetch(`/ad-price/${adId}`)
            .then(response => response.json())
            .then(data => {
                // 결과값을 가져와서 해당 span 엘리먼트에 추가합니다.
                var resultSpan = document.getElementById(`result-${adId}`);
                // 결과값을 #,### 형식으로 형식화합니다.
                var formattedPrice = new Intl.NumberFormat().format(data);
                // 결과값에 "원"을 붙여서 출력합니다.
                resultSpan.innerText = formattedPrice + "원";
            })
            .catch(error => {
                console.error("Error fetching banner ad price for Ad ID", adId, ":", error);
            });
    });
});





		 function updatePostStatus(adId) {
		        let postYn = $("#postYn-" + adId).val();
		        $.ajax({
		            type: "PUT",
		            url: "/updatepost/" + adId,
		            contentType: "application/json",
		            data: JSON.stringify({ "post_yn": postYn }),
		            success: function () {
		                // 성공적으로 업데이트됐을 때 처리할 내용
		                alert("광고 상태가 업데이트되었습니다.");
		                 location.reload();
		            },
		            error: function () {
		                // 오류 발생 시 처리할 내용
		                alert("광고 상태를 업데이트하는 중 오류가 발생했습니다.");
		            }
		        });
		    }
		    
		    

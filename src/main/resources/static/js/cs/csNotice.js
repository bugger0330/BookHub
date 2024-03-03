// Notice list에서 View 위한 클릭 이벤트
function load() {
	const pageClick = $(".page-click");
	pageClick.on("click", function() {
		window.location.href = "/notice/view/" + $(this).attr("id");
	});
}

load();

// Notice list에서 View Id 넘겨주기
function loadId() {
	const title = $("#title");
	const content = $("#content");
	const addressNum = window.location.pathname.split("/")[3];
	$.ajax({
		type: "post",
		url: "/notice/view",
		data: {
			id: Number(addressNum)
		},
		success: function(data) {
			title.value = data.title;
			content.value = data.content;
		},
		error: function() {
			alert("error!!!");
		}
	});
}

loadId();// 실행
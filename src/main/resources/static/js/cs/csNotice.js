const title = $("#title"); 
const content = $("#content"); 
let addressNum = window.location.pathname.split("/")[3];

// Notice list에서 View 위한 클릭 이벤트
function loadView() {
	const pageClick = $(".page-click");
	pageClick.on("click", function() {
		window.location.href = "/notice/view/" + $(this).attr("id");
	});
}

loadView();

// Notice list에서 View Id 넘겨주기
function loadViewId() {
    $.ajax({
        type: "post",
        url: "/notice/view",
        data: {
            id: Number(addressNum)
        },
        success: function(data) {
            // title-display 엘리먼트에 데이터 출력
            $("#title-display").html(data.title);

            // content-display 엘리먼트에 데이터 출력
            $("#content-display").html(data.content);
            
            // file-display 엘리먼트에 데이터 출력
            $("#file-display").html(data.filepath);
        },
        error: function() {
            alert("Error fetching data!");
        }
    });
}

// 페이지 로드 시 데이터 로딩 함수 호출
$(document).ready(function() {
    loadViewId();
});



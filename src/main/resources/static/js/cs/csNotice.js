let title;
let content;


  // 제목과 내용 가져오기
        title = $("#title").val();
        content = $("#content").summernote('code');
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



$(document).ready(function() {
    // 공지사항 작성 폼이 제출될 때 실행되는 함수
    $("form").submit(function(event) {
        // 기본 동작(stop default behavior) 방지
        event.preventDefault();
        
       // 제목과 내용 가져오기
        let title = $("#title").val();
        let content = $("#content").val();
        
        // 가져온 제목과 내용을 로그에 출력
        console.log("제목:", title);
        console.log("내용:", content);
        // 파일 정보 가져오기
        let files = [];
        $("input[name='filepath']").each(function(index, element) {
            if (element.files.length > 0) {
                files.push(element.files[0]);
            }
        });

        // FormData 객체 생성
        let formData = new FormData();
        formData.append("title", title);
        formData.append("content", content);

        // 공지사항 등록 요청 보내기
        $.ajax({
            url: "/api/notice",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                /* // 공지사항 등록 성공 시 경고창 표시 후 페이지 리로드
                alert("공지사항이 성공적으로 등록되었습니다.");
                window.location.reload();*/
            },
            error: function(xhr, status, error) {
                // 공지사항 등록 실패 시 에러 메시지 표시
                console.error("Failed to add notice:", error);
                alert("공지사항을 등록하는 중에 오류가 발생했습니다.");
            }
        });
    });
});
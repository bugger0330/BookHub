const title = $("#title"); // jQuery로 태그 선택
const content = $("#content"); // jQuery로 태그 선택

let addressNum = window.location.pathname.split("/")[3]; // 업데이트 페이지에도 쓰기 위해서 위로 올림

// qna list에서 상세보기 위한 클릭 이벤트
function load() {
    const pageClick = $(".page-click"); // jQuery로 태그 선택
    pageClick.on("click", function() {
        window.location.href = "/qna/view/" + $(this).attr("id"); // jQuery로 현재 요소의 id 속성 값 가져오기
    });
}

load();

// qna 문의글 작성
let postObject = {
    init: function() {
        $("#btn-insert").on("click", () => {
            this.insertPost();
        });
        // updatePost(), deletePost() 함수 추가

        /*// view 페이지 로드
        $.ajax({
            type: "post",
            url: "/qna/view",
            data: {
                id: Number(addressNum)
            },
            success: function(data) {
                title.val(data.title); // jQuery 메서드로 값 설정
                content.val(data.content); // jQuery 메서드로 값 설정
            },
            error: function() {
                alert("error!!!");
            }
        });*/
    },

    insertPost: function() {
        // 사용자가 입력한 제목과 내용을 가져옵니다.
        const titleValue = title.val(); // jQuery 메서드로 값 가져오기
        const contentValue = content.summernote('code'); // summernote에서 HTML 코드를 가져옵니다.

        // AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/qna/insert",
            data: {
                title: titleValue,
                content: contentValue
            },
            success: function(data) {
                if (data === true) {
                    // 성공적으로 데이터가 저장되었을 때, 목록 페이지로 이동합니다.
                    window.location.href = "/qna/list";
                } else {
                    // 실패했을 때 처리할 내용을 작성하세요.
                    alert("데이터 저장에 실패했습니다.");
                }
            },
            error: function() {
                // 에러가 발생했을 때 처리할 내용을 작성하세요.
                alert("서버와의 통신 중 에러가 발생했습니다.");
            }
        });
    }
};

postObject.init();



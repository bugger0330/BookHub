const title = $("#title"); 
const content = $("#content"); 
const filepath = $("#formFileMultiple"); 
const updateBtn = document.querySelector("#btn-update");
const deleteBtn = document.querySelector("#btn-delete");

let addressNum = window.location.pathname.split("/")[3];

// qna list에서 등록 위한 클릭 이벤트
function loadInsert() {
    const insertClick = $("#btnInsert"); 
    insertClick.on("click", function() {
        window.location.href = "/qna/insert"; 
    });
}
loadInsert();

// qna list에서 상세보기 위한 클릭 이벤트
function loadView() {
    const pageClick = $(".page-click"); 
    pageClick.on("click", function() {
        window.location.href = "/qna/view/" + $(this).attr("id"); 
    });
}
loadView();

/*// qna 문의글 작성
let postObject = {
    init: function() {
        $("#btn-insert").on("click", () => {
            this.insertPost();
        });
    },

    insertPost: function() {
        // 사용자가 입력한 제목과 내용을 가져옵니다.
        const titleValue = title.val(); // jQuery 메서드로 값 가져오기
        const contentValue = content.summernote('code'); // summernote에서 HTML 코드를 가져옵니다.
		const filepathValue = filepath.val(); 

        // AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/qna/insert",
            data: {
                title: titleValue,
                content: contentValue,
                filepath: filepathValue
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

postObject.init();*/

// qna view에서 수정하기 페이지 이동
updateBtn.onclick = () => {
	$.ajax({
		type : "post",
		url : "/qna/update/" + addressNum, // detailveiw에서 pk값인 id잡아서 같이 넘겨준다
		data : {
			title : title.value,
			content : content.value,
		}, // ajax로 컨트롤러에 값을 들고 요청함
		success : function(data){
			if(data == true){
				window.location.href = "/qna/list"
			}else{
				window.location.href = "/qna/update";
			}
		},
		error : function(){
			alert("error!!!");
		}
	});
}

// 수정하기 (상세페이지에서 클릭하면 업데이트페이지로 이동함)
//updateBtn.onclick = () => {
//	window.location.href = "/qna/update/" + addressNum;
//}

function loadViewId() {
	
	$.ajax({
		type: "post",
		url: "/qna/view",
		data: {
			id: Number(addressNum) // 문자를 숫자로 변환하는 함수 , JSON.stringify(obj) 제이슨을 문자형태로 변경 
		},
		success: function(data) {
			title.value = data.title;
			content.value = data.content;
		},
		error: function() {
			alert("error!!!");
		}
	});
	

	// 삭제하기 
	deleteBtn.onclick = () => {
		$.ajax({
			type: "post",
			url: "/qna/delete/" + addressNum, // detailveiw에서 pk값인 id잡아서 같이 넘겨준다
			success: function(data) {
				if (data == true) {
					window.location.href = "/qna/list"
				} else {
					window.location.href = "/qna/delete";
				}
			},
			error: function() {
				alert("error!!!");
			}
		});
	}

}
loadViewId();// 실행

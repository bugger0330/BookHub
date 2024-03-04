const title = $("#title");
const content = $("#content");
const filepath = $("#formFileMultiple");
const updateBtn = $("#btn-update");
const deleteBtn = $("#btn-delete");

// 수정완료, 삭제하기, 리스트 alert창, 등록버튼

let addressNum = window.location.pathname.split("/")[3];

// qna list에서 등록 위한 클릭 이벤트
function loadInsert() {
	const insertClick = $("#btnInsert");
	insertClick.on("click", function() {
		window.location.href = "/qna/insert";
	});
}
loadInsert();

// qna list에서 View 위한 클릭 이벤트
function loadView() {
	const pageClick = $(".page-click");
	pageClick.on("click", function() {
		window.location.href = "/qna/view/" + $(this).attr("id");
	});
}
loadView();


// qna 문의글 답글 작성
let replyObject = {
	init: function() {
		$("#btn-save-reply").on("click", () => {
			this.insertReply();
		});
	},

	insertReply: function() {
		
		alert("댓글 등록 요청됨");
			
		const replyContent  = $("#reply-content").val(); 
		
		// AJAX 요청을 보냅니다.
		$.ajax({
			type: "POST",
			url: "/qna/reply/" + addressNum,
			contentType: "application/json",  // Content-Type을 JSON으로 설정
            data: JSON.stringify({
				id: Number(addressNum),
                content: replyContent
            }),
			success: function(data) {
				console.log(data);
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

replyObject.init();
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



 //수정하기 (상세페이지에서 클릭하면 업데이트페이지로 이동함)
updateBtn.on("click", function() {
    window.location.href = "/qna/update/" + addressNum;
});

function loadViewId() {
	$.ajax({
		type: "post",
		url: "/qna/view",
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

			// 수정 버튼 클릭 시 데이터 전달
			//$("#btn-update").on("click", function() {
				// 수정 페이지로 이동
				//window.location.href = "/qna/update/" + data.id + "?title=" + encodeURIComponent(data.title) + "&content=" + encodeURIComponent(data.content);
			//});
		},
		error: function() {
			alert("Error fetching data!");
		}
	});

	// qna 수정하기 완료 ///////////파일처리안됐음
	$("#btn-update-complete").on("click", function() {
		// 수정된 데이터 가져오기
		const updatedTitle = $("#updated-title").val(); // 수정된 제목
		const updatedContent = $("#updated-content").val(); // 수정된 내용

		// AJAX를 사용하여 서버로 수정된 데이터 전송
		$.ajax({
			type: "post",
			url: "/qna/update/" + addressNum,
			data: {
				title: updatedTitle,
				content: updatedContent
			},
			success: function(data) {
				if (data === true) {
					// 수정이 성공했을 때, 목록 페이지로 이동
					window.location.href = "/qna/list";
				} else {
					// 수정이 실패했을 때의 처리
					alert("데이터 수정에 실패했습니다.");
				}
			},
			error: function() {
				// 통신 에러 시의 처리
				alert("서버와의 통신 중 에러가 발생했습니다.");
			}
		});
	});

	// 삭제하기 
	deleteBtn.on("click", function() {
		$.ajax({
			type: "post",
			url: "/qna/delete/" + addressNum,
			success: function(data) {
				if (data == true) {
					window.location.href = "/qna/list";
				} else {
					alert("데이터 삭제에 실패했습니다.");
				}
			},
			error: function() {
				alert("서버와의 통신 중 에러가 발생했습니다.");
			}
		});
	});


}
// 페이지 로드 시 데이터 로딩 함수 호출
loadViewId();



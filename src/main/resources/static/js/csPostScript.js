//qna list에서 상세보기 위한 클릭 이벤트
function load(){
	const pageClick = document.querySelectorAll(".page-click");
	for(let i = 0; i < pageClick.length; i++){
		pageClick[i].onclick = () => {
			window.location.href = "/qna/view/" + pageClick[i].id;
		}
	}// for()
}

load();

//qna 문의글 작성, 수정, 삭제
let postObject = {

	init: function() {
		let _this = this;
		$("#btn-insert").on("click", () => {
			_this.insertPost();
		});
		$("#btn-update").on("click", () => {
			_this.updatePost();
		});
		$("#btn-delete").on("click", () => {
			_this.deletePost();
		});
		
	},

	insertPost : function() {
		$.ajax({
		type : "post",
		url : "/qna/insert", // detailveiw에서 pk값인 id잡아서 같이 넘겨준다
		data : {
			title : title.value,
			content : content.value,
		}, // ajax로 컨트롤러에 값을 들고 요청함
		success : function(data){
			if(data == true){
				window.location.href = "/qna/list"
			}else{
				window.location.href = "/qna/insert";
			}
		},
		error : function(){
			alert("실패");
		}
	});
	
	
	$.ajax({
		type : "post",
		url : "/qna/view",
		data : {
			id : Number(addressNum) 
		},
		success : function(data){
			title.value = data.title;
			content.value = data.content;
		},
		error : function(){
			alert("error!!!");
		}
	});
		
/*		alert("포스트 등록 요청됨");
		let post = {
			title : $("#title").val(),
			content : $("#content").val()
		}

		$.ajax({
			type: "POST",
			url: "/qna/insert",
			data: JSON.stringify(post),
			contentType: "application/json; charset=utf-8"		
		}).done(function(response) {
			let status = response["status"];
			if(status == 200) {
				let message = response["data"];
				alert(message);
				location = "/";
			} else {
				let warn = "";
				let errors = response["data"];
				if(errors.title != null) warn = warn + errors.title + "\n";
				if(errors.content != null) warn = warn + errors.content;
				alert(warn);
			}
		}).fail(function(error) {
			let message = error["data"];
			alert("문제 발생 : " + message);
		});*/
	},
	
	updatePost : function() {
		alert("포스트 수정 요청됨");
		let post = {
			id : $("#id").val(),
			title : $("#title").val(),
			content : $("#content").val()
		}
 
		$.ajax({
			type: "PUT",
			url: "/post",
			data: JSON.stringify(post),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			let message = response["data"];
			alert(message);
			location = "/";
		}).fail(function(error) {
			let message = error["data"];
			alert("문제 발생 : " + message);
		});
	},
	
	deletePost : function() {
		alert("포스트 삭제 요청됨");
		let id = $("#id").text();
 
		$.ajax({
			type: "DELETE",
			url: "/post/" + id,
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			let message = response["data"];
			alert(message);
			location = "/";
		}).fail(function(error) {
			let message = error["data"];
			alert("문제 발생 : " + message);
		});
	},
	

}
postObject.init();
const title = document.querySelector("input"); // 태그명
const content = document.querySelector("textarea"); // 태그명

let addressNum = window.location.pathname.split("/")[3]; // 업데이트 페이지에도 쓰기 위해서 위로 올림

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


//qna 문의글 작성
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
	
	$.ajax({
		type : "post",
		url : "/notice/view",
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
	
		

	},
}

postObject.init();
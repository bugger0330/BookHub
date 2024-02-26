const title = document.querySelector("#title"); 
const content = document.querySelector("#content"); 
const updateBtn = document.querySelector("#btn-update"); 


let addressNum = window.location.pathname.split("/")[3]; // 업데이트 페이지에도 쓰기 위해서 위로 올림



// 수정하기 (디테일페이지에서 클릭하면 업데이트페이지로 이동함)
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

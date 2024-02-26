const title = document.querySelector("input");
const content = document.querySelector("textarea");

const button = document.querySelector("#btn-update");

let addressNum = window.location.pathname.split("/")[3]; // 업데이트 페이지에도 쓰기 위해서 위로 올림

function load() {
	console.log("id번호", window.location.pathname); // 도메인 주소를 제외한 나머지 주소를 가져온다. uri주소를 가져옴

	$.ajax({
		type: "post",
		url: "/qna/view",
		data : {
			id : Number(addressNum) // 문자를 숫자로 변환하는 함수 , JSON.stringify(obj) 제이슨을 문자형태로 변경 
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

// 수정하기 (상세페이지에서 클릭하면 업데이트페이지로 이동함)
button.onclick = () => {
	window.location.href = "/qna/update/"+ addressNum;
}




load();// 실행
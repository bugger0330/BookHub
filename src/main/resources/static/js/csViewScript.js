const title = document.querySelector("input");
const content = document.querySelector("textarea");


let addressNum = window.location.pathname.split("/")[3]; // 업데이트 페이지에도 쓰기 위해서 위로 올림

function load(){
	console.log("id번호", window.location.pathname); // 도메인 주소를 제외한 나머지 주소를 가져온다. uri주소를 가져옴
	// http://localhost:80/home
	// url : localhost:80
	// uri : /home
	console.log("id번호", window.location.pathname.split("/")[0]); // 없음
	console.log("id번호", window.location.pathname.split("/")[1]); // board
	console.log("id번호", window.location.pathname.split("/")[2]); // test
	console.log("id번호", window.location.pathname.split("/")[3]); // detail
	console.log("id번호", window.location.pathname.split("/")[4]); // id값
	// 문자열.split("/") ? 문자열에서 슬러시(/)를 찾고, 찾은 위치에서 앞 뒤로 문자열을 잘라 배열에 담아줌.
	
	
	
	

	
	$.ajax({
		type : "post",
		url : "/qna/view",
		data : {
			id : Number(addressNum) // 문자를 숫자로 변환하는 함수 , JSON.stringify(obj) 제이슨을 문자형태로 변경 
		},
		success : function(data){
			title.value = data.title;
			content.value = data.content;
		},
		error : function(){
			alert("error!!!");
		}
	});
	

	
}




load();// 실행
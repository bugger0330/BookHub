const shareUsername = document.querySelector(".share--username")
const myPoint = document.querySelector(".share--mypoint");
const inputs = document.querySelectorAll(".share--book-input");
const textarea = document.querySelector(".share--textarea");
const fileInput = document.querySelector(".share--book-input-file");
const imgViewBox = document.querySelector(".share--img-box");
const btn = document.querySelector(".share--btn");

//const username = "dddd1111";
let fileValue = "";

load();
function load(){
	myPoint.textContent = 0;
	
	//myPoint.textContent = 0;
	if(memberId == ""){
		alert("로그인이 필요한 서비스 입니다.");
		window.location.href = "/login";
	}
	$.ajax({
		type : "post",
		url : "/point/get",
		data : {
			userName : memberId
		},
		success : function(data){
			if(data != null){
				shareUsername.textContent = memberId;
				myPoint.textContent = data;
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

/**
 * 0 - 도서명
 * 1 - 출판사
 * 2 - 작가
 * 기본설명
 * 첨부
 * 미리보기
 */

btn.onclick = () => {
	if(memberId == ""){
		alert("로그인이 필요한 서비스 입니다.");
		window.location.href = "/login";
	}
	if(inputs[0].value == ""){
		alert("도서명을 입력하세요!");
		inputs[0].focus();
		return;
	}else if(inputs[1].value == ""){
		alert("출판사를 입력하세요!");
		inputs[1].focus();
		return;
	}else if(inputs[2].value == ""){
		alert("작가명을 입력하세요!");
		inputs[2].focus();
		return;
	}else if(textarea.value == ""){
		alert("기본 설명을 입력하세요!");
		textarea.focus();
		return;
	}else if(fileInput.value == ""){
		alert("책 이미지 파일을 첨부하세요!");
		return;
	}else if(Number(myPoint.textContent) < 1000){
		alert("포인트가 부족합니다.");
		return;
	}
	
	const shareInfo = {
		bookName : inputs[0].value,
		company : inputs[1].value,
		writer : inputs[2].value,
		descript : textarea.value,
		userName : memberId
	}
	
	
	// 파일은 따로
	let formData = new FormData();
    formData.append("shareInfo", new Blob([JSON.stringify(shareInfo)], {type: "application/json"}));
    formData.append("file", fileValue);
    
	if(confirm("등록시 1000 포인트가 결제 됩니다. 계속하시려면 확인을 눌러주세요!")){
		// 등록기능
		$.ajax({
			type : "post",
			url : "/share/book/write",
			contentType : false,
			processData: false,
			enctype: "multipart/form-data",
			data : formData,
			success : function(data){
				if(data == true){
					myPointOrder();
				}
			},
			error : function(){
				alert("에러");
			}
		})
	}
	
}

fileInput.onchange = (event) => {
	if(event.target.files[0].size > 5242880){ // 5 mb 까지만 가능
		alert("첨부파일은 5mb 이하만 가능합니다.");
		fileInput.value = "";
		return;
	}
	
	let fileCut = fileInput.value.split("\\");
	let fileLastName = (fileCut[fileCut.length - 1]).split(".")[1];
	
	if(fileLastName == "gif" || fileLastName == "jpeg" || fileLastName == "jpg" || fileLastName == "png" ||
        fileLastName == "GIF" || fileLastName == "JPEG" || fileLastName == "JPG" || fileLastName == "PNG"){
		const reader = new FileReader();
        
        reader.readAsDataURL(event.target.files[0]);
        fileValue = event.target.files[0];
        reader.onload = () => {
            const img = document.createElement('img');
            img.setAttribute('src',  reader.result);
            imgViewBox.appendChild(img);
            imgData = reader.result;
        }
	}else{
		alert("이미지 파일만 첨부 가능합니다.");
		fileInput.value = "";
		return;
	}
}

function myPointOrder(){
	$.ajax({
		type : "post",
		url : "/share/mypoint",
		data : {
			userName : memberId,
			price : 1000
		},
		success : function(data){
			if(data == true){
				alert("등록되었습니다!");
				window.location.href = "/share/read";
			}
		},
		error : function(){
			alert("에러");
		}
	});
}






























const select = document.querySelector(".book--search--select");
const searchOptions = select.querySelectorAll("option");
const searchInput = document.querySelector(".book--search--select--input");
const searchBtn = document.querySelector(".book--search--search--btn");
const bookBox = document.querySelector(".book--search--inner--box");
const nothingText = document.querySelector(".book--search--nothing--text");

searchInput.onkeyup = () => {
	if(window.event.keyCode==13){
		if(searchInput.value == ""){
			alert("검색어를 입력해주세요!");
			return;
		}
		nothingText.textContent = "";
		
		let str = searchInput.value;
		let pattern = /^[a-zA-Zㄱ-힣0-9|s]*$/;
		
		if (str.match(pattern)) {
		  if (str.match(pattern).length > 0) {
		    let option = "";
			for(let i = 0; i < searchOptions.length; i++){
				if(searchOptions[i].selected){
					option = searchOptions[i].value;
				}
			}
			$.ajax({
				type : "get",
				url : `/book/search/${option}/${searchInput.value}`,
				async : false,
				success : function(data){
					if(data != ""){
						innerFun(data);
					}else{
						nothingText.textContent = "검색 결과가 없습니다.";
						bookBox.innerHTML = "";
					}
				},
				error : function(){
					alert("에러");
				}
			});
		  }
		}else{
			nothingText.textContent = "검색 결과가 없습니다.";
			bookBox.innerHTML = "";
		}
	}
}


searchBtn.onclick = () => {
	if(searchInput.value == ""){
		alert("검색어를 입력해주세요!");
		return;
	}
	nothingText.textContent = "";
	
	let str = searchInput.value;
	let pattern = /^[a-zA-Zㄱ-힣0-9|s]*$/;
	
	if (str.match(pattern)) {
	  if (str.match(pattern).length > 0) {
		    let option = "";
			for(let i = 0; i < searchOptions.length; i++){
				if(searchOptions[i].selected){
					option = searchOptions[i].value;
				}
			}
			$.ajax({
				type : "get",
				url : `/book/search/${option}/${searchInput.value}`,
				async : false,
				success : function(data){
					if(data != ""){
						innerFun(data);
					}else{
						nothingText.textContent = "검색 결과가 없습니다.";
						bookBox.innerHTML = "";
					}
				},
				error : function(){
					alert("에러");
				}
			});
	  }
	}else{
		nothingText.textContent = "검색 결과가 없습니다.";
		bookBox.innerHTML = "";
	}
}

function innerFun(data){
	let innr = "";
	if(data != null){
		for(let i = 0; i < data.length; i++){
			innr += `
			<div class="book--search--book--box" id="${data[i].id}">
				<div class="book--search--image--box">
	                <img src="${data[i].img}" class="book--search--book--image">
	            </div>
	            <div class="book--search--title--box">
	                <span class="book--search--book--title">${data[i].bookName}</span>
	            </div>
            </div>
			`;
		}
		bookBox.innerHTML = innr;
		const imgLink = document.querySelectorAll(".book--search--book--box");
		imageClickEvent(imgLink);
	}
}

function imageClickEvent(list){
	if(list != null){
		for(let i = 0; i < list.length; i++){
			list[i].onclick = () => {
				location.href = "/book/detail/" + list[i].id;
			}
		}
	}
}






const bookBox = document.querySelector(".book--list--main--div");

load();
function load(){
	$.ajax({
		type : "get",
		url : "/book/all",
		success : function(data){
			if(data != null){
				innerFun(data);
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

function innerFun(data){
	let innr = "";
	if(data != null){
		for(let i = 0; i < data.length; i++){
			innr += `
			<div class="book--list--book--box" id="${data[i].id}">
				<div class="book--list--image--box">
	                <img src="${data[i].img}" class="book--list--book--image">
	            </div>
	            <div class="book--list--title--box">
	                <span class="book--list--book--title">${data[i].bookName}</span>
	            </div>
            </div>
			`;
		}
		bookBox.innerHTML = innr;
		const imgLink = document.querySelectorAll(".book--list--book--box");
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









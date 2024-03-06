const innerBody = document.querySelector(".share--book-list-box");

load();

function load(){
	$.ajax({
		type : "get",
		url : "/share/product/all",
		async : false,
		success : function(data){
			if(data != ""){
				innerFun(data);
			}
		}
	});
}

function innerFun(data){
	let innr = "";
	for(let i = 0; i < data.length; i++){
		innr += `
			<div class="share--book-box" id="${data[i].id}">
                <div class="share--img-box">
                    <img src="/images/upload/${data[i].file}" alt="책" class="share--book-img">
                </div>
                <div class="share--content-box">
                    <span>${data[i].bookName}</span>
                    <span>${data[i].writer}</span>
                    <span>${data[i].company}</span>
                </div>
            </div>
		`;
	}
	innerBody.innerHTML = innr;
	const bookTag = document.querySelectorAll(".share--book-box");
	pagingEvent(bookTag);
}

function pagingEvent(tags){
	for(let i = 0; i < tags.length; i++){
		tags[i].onclick = () => {
			window.location.href = "/share/detail/" + tags[i].id;
		}
	}
}











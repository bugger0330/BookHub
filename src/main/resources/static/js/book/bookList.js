const bookBox = document.querySelector(".book--list--inner--box");
let nowPage = 0;

load(nowPage);
function load(firstPage){
	$.ajax({
		type : "get",
		url : `/book/all/${firstPage}`,
		success : function(data){
			if(data != null){
				innerFun(data);
				boardPageNum(data[0].bookAllCount);
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


function boardPageNum(data) {
	const boardListPage = document.querySelector('.page--num--box');
	const preNextBtn = document.querySelectorAll('.page--bar--btn');	// 이전/다음 버튼
	
	const totalPageCount = data % 5 == 0 ? Math.floor(data / 5) : Math.floor(data / 5) + 1;
	
	const startIndex = nowPage % 5 == 0 ? (nowPage + 1) : nowPage - Math.floor(nowPage % 5) + 1;
	const endIndex = startIndex + 4 <= totalPageCount ? startIndex + 4 : totalPageCount;
	
	let pageNum = ``;
	for(let i = startIndex; i <= endIndex; i++){
		pageNum += `<span class="page--link">${i}</span>`;
	}
	 
	boardListPage.innerHTML = pageNum;
	
	preNextBtn[0].onclick = () => { // 이전 버튼
		nowPage = startIndex != 1 ? startIndex - 1 : 1;
		load(nowPage);
	}
	
	preNextBtn[1].onclick = () => { // 다음 버튼
		nowPage = endIndex != totalPageCount ? endIndex + 1 : totalPageCount;
		load(nowPage);
	}
	
	const pageButton = boardListPage.querySelectorAll('span');
	for(let i = 0; i < pageButton.length; i++){
		pageButton[i].onclick = () => {
			nowPage = pageButton[i].textContent;
			load(nowPage);
			pageButton[i].className = "page--link--on";
			
		}
	}
	
	
}






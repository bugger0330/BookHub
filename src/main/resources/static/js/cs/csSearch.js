
const select = document.querySelector(".searchType");
const options = select.querySelectorAll("option");
const searchButton = document.querySelector(".searchButton");
const searchInput = document.querySelector(".searchInput");
const noticeLists = document.querySelector(".noticeLists");

load();

function load(){
	$.ajax({
		type : "get",
		url : "/api/notice/list",
		success : function(data){
			innerFun(data);
		},
		error : function(){
			alert("에러");
		}
	});
}

let searchType = "";
searchButton.onclick = () => {
	
	
	for(let i = 0; i < options.length; i++){
	if(options[i].selected){
		searchType = options[i].value;
		
	}
}

console.log("검색어:" + searchInput.value);

	$.ajax({
		type : "get",
		url : "/api/notice/search-list", 
		data : {
			searchType: searchType,
			searchInput: searchInput.value
		}, 
		success : function(data){
				innerFun(data);
			if(data != ""){
			}
		},
		error : function(){
			alert("error!!!!");
		}
	});

}

function innerFun(data){
	let innr = "";
	for(let i = 0; i < data.length; i++){
		innr += `
			<tr class="page-click" id="${data[i].id}">
				<td><i class="bi bi-megaphone-fill text-danger">${data[i].id}</i></td>
				<td class="text-left" width="50%">
					<div class="panel-cs-container">
						<p class="panel-cs-title">${data[i].title}</p>
					</div>
				</td>
				<td><i class="bi bi-file-earmark-text-fill">${data[i].filepath}</i></td>
				<td>${data[i].writer}</td>
				<td>${data[i].rdate}</td>
			</tr>
		`;
	}
	noticeLists.innerHTML = innr;

}

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



function innerFun(data) {
    data.sort((a, b) => b.id - a.id);
    let innr = "";
    for (let i = 0; i < data.length; i++) {
        const date = new Date(data[i].rdate);

        const formattedDate = date.toLocaleDateString("en-GB", {
            day: "2-digit",
            month: "2-digit",
            year: "numeric"
        }).replace(/\//g, '-');

        // 상위 3개 행에만 아이콘 추가
        const icon = i < 3 ? '<i class="bi bi-megaphone-fill text-danger"></i>' : '';

        // 사용자 이름 가운데 두 글자 마스킹 처리
        const maskedWriter = maskWriter(data[i].writer);

        innr += `
            <tr class="page-click" id="${data[i].id}">
                <td>${icon}${data[i].id}</td>
                <td class="text-left" width="50%">
                    <div class="panel-cs-container">
                        <p class="panel-cs-title">${data[i].title}</p>
                    </div>
                </td>
                <td>${data[i].filepath}</td>
                <td>${maskedWriter}</td>
                <td>${formattedDate}</td>
            </tr>
        `;
    }
    noticeLists.innerHTML = innr;
    const pageRows = document.querySelectorAll(".page-click");
    for (let i = 0; i < pageRows.length; i++) {
        pageRows[i].onclick = () => {
            location.href = "/notice/view/" + pageRows[i].id;
        }
    }
}

function maskWriter(writer) {
    // 사용자 이름의 가운데 두 글자 마스킹 처리
    if (writer.length <= 2) {
        return '*'.repeat(writer.length);
    }
    const midIndex = Math.floor(writer.length / 2);
    return writer.substring(0, midIndex - 1) + '*'.repeat(2) + writer.substring(midIndex + 1);
}

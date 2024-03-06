const innerBody = document.querySelector(".cate-body");


cateLoad();

function cateLoad(){
	const arrs = (JSON.parse(localStorage.getItem("listData")) == null) ? 
		null : (JSON.parse(localStorage.getItem("listData")));
	if(arrs == null){
		$.ajax({
	        type : "get",
	        url : "/csCategory",
	        async : false,
	        success : function(cData){
	            if(cData != ""){
	                innerFun(cData);
	                arrFun(cData);
	            }
	        },
	        error : function(){
	            alert("에러");
	        }
	    });
	}else{
		innerFun(arrs);
	}
}

function arrFun(data){
	const listData = new Array();
	for(let i = 0; i < data.length; i++){
		listData.push(data[i]);
	}
	localStorage.setItem("listData", JSON.stringify(listData));
}


function innerFun(data){
    let innr = "";
    for(let i = 0; i < data.length; i++){
        innr += 
            newFunction(data, i)
        ;
    }
    innerBody.innerHTML = innr;

    const cChild = document.querySelectorAll(".cate-child");
    for(let v = 0; v < data.length; v++){
        let innr2 = "";
        for(let g = 0; g < data[v].respList.length; g++){
            innr2 += `
                <span class="child-item">${data[v].respList[g].c2Name}</span>
                <input class="hidden-address" type="hidden" value="${data[v].respList[g].address}" />
            `;
        }// for(let g
        cChild[v].innerHTML = innr2;
    }// for(let k

    for(let i = 0; i < cChild.length; i++){
        cChild[i].style.display = "none";
    }
    const cHeader = document.querySelectorAll(".cate-header");
    for(let i = 0; i < cHeader.length; i++){
        cHeader[i].onclick = () => {
            if(cChild[i].style.display == "none"){
				for(let k = 0; k < cChild.length; k++){
					cChild[k].style.display = "none";
				}
            	cChild[i].style.display = "flex";
            }else{
				for(let k = 0; k < cChild.length; k++){
					cChild[k].style.display = "none";
				}
                cChild[i].style.display = "none";
            }
        }
    }
    const childItems = document.querySelectorAll(".child-item");
    const hiddenAddress = document.querySelectorAll(".hidden-address");
    
    for(let i = 0; i < childItems.length; i++){
		childItems[i].onclick = () => {
			location.href = hiddenAddress[i].value;
		}
	}
}

function newFunction(data, i) {
    return `
    <div class="cate-header">
        <span class="cate1-title">${data[i].c1Name}</span>
    </div>
    	<div class="cate-child"></div>`;
}
const innerBody = document.querySelector(".main-cate1");


load();

function load(){
    $.ajax({
        type : "get",
        url : "/csCategory",
        success : function(data){
            if(data != ""){
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
    for(let i = 0; i < data.length; i++){
        innr += 
            newFunction(data, i)
        ;
    }
    innerBody.innerHTML = innr;

    const cChild = document.querySelectorAll(".cate-child");
    for(let k = 0; k < data.length; k++){
        let innr2 = "";
        for(let g = 0; g < data[k].respList.length; g++){
            console.log("dddddd2", data[k].respList[g]);
            innr2 += 
                <span>${data[k].respList[g].c2Name}</span>
            ;
        }// for(let g
        cChild[k].innerHTML = innr2;
    }// for(let k

    for(let i = 0; i < cChild.length; i++){
        cChild[i].style.display = "none";
    }
    const cHeader = document.querySelectorAll(".cate-header");
    for(let i = 0; i < cHeader.length; i++){
        cHeader[i].onclick = () => {
            if(cChild[i].style.display == "none"){
            cChild[i].style.display = "flex";
            }else{
                cChild[i].style.display = "none";
            }
        }
    }
}

function newFunction(data, i) {
    return <div class="cate-header">
        <span class="cate1-title">${data[i].c1Name}</span>
    </div>, <div class="cate-child"></div>;
}

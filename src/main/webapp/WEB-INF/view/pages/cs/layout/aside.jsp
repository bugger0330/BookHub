<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- CS aside Start -->

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
	<a href="/"
		class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
		<span class="fs-4">열린공간</span>
	</a>

	<div class="main-cate1">
		<div class="cate-header">
			<span class="cate1-title">고객서비스</span>
		</div>
		<div class="cate-child">
			<span>안내</span> <span>서비스</span> <span>주의</span>
		</div>
	</div>

	<hr>
</div>

<!-- CS aside End -->
<script>
const innerBody = document.querySelector(".main-cate1");


load();

function load(){
    $.ajax({
        type : "get",
        url : "/category",
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
            <div class="cate-header">
                <span class="cate1-title">${data[i].c1Name}</span>
            </div>
            <div class="cate-child"></div>
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
</script>
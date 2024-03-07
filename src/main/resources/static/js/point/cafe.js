const coffieCheck = document.querySelectorAll(".menu--checkbox--coffie");
const coffieCount = document.querySelectorAll(".coffie--count");
const coffiePrice = document.querySelectorAll(".menu--price--coffie");
const myPoint = document.querySelector(".mypoint");
const priceAll = document.querySelector(".price--all");
const orderBtn = document.querySelector(".order--btn");
const productName = document.querySelectorAll(".product--name");

load();
function load(){
	$.ajax({
		type : "post",
		url : "/point/get",
		data : {
			userName : memberId
		},
		success : function(data){
			if(data != null){
				myPoint.textContent = data;
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

let allPoint = 0;
for(let i = 0; i < coffieCheck.length; i++){ // checkbox onchange
	coffieCheck[i].onchange = () => {
		allPoint = checkTrue();
		priceAll.textContent = allPoint;
		return;
	}// check event
}
for(let i = 0; i < coffieCount.length; i++){ // input onchange
	coffieCount[i].onchange = () => {
		if(coffieCount[i].value < 0){
			coffieCount[i].value = 0;
		}
		allPoint = checkTrue();
		priceAll.textContent = allPoint;
		return;
	}
}
function multiplyFun(item, count){
	return Number(item) * Number(count);
}

function checkTrue(){
	let allPoint = 0;
	for(let k = 0; k < coffieCount.length; k++){
		if(coffieCheck[k].checked == true){
			let multiply2 = multiplyFun(coffiePrice[k].textContent, coffieCount[k].value);
			allPoint += Number(multiply2);
		}
	}
	return allPoint;
}

orderBtn.onclick = () => {
	if(memberId == ""){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/login";
		return;
	}
	
	let flag = 0;
	for(let i = 0; i < coffieCheck.length; i++){
		if(coffieCheck[i].checked == true && coffieCount[i].value != 0){
			flag += 1;
		}
	}
	if(flag == 0){
		alert("주문을 먼저 해주세요!");
		return;
	}
	if(Number(myPoint.textContent) < Number(priceAll.textContent)){
		alert("포인트가 부족합니다.");
		return;
	}
	let orderArray = new Array();
	for(let i = 0; i < coffieCheck.length; i++){
		if(coffieCheck[i].checked == true && coffieCount[i].value != 0){
			const orders = {
				productName : productName[i].textContent,
				productPrice : Number(coffiePrice[i].textContent),
				productCount : coffieCount[i].value,
				allProductPrice : (Number(coffiePrice[i].textContent) * Number(coffieCount[i].value)),
				userName : memberId,
				orderId : -1,
				refundType : "환불가능"
			};
			orderArray.push(orders);
		}
	}
	console.log("주문정보",orderArray);
	$.ajax({
		type : "post",
		url : "/point/order",
		contentType : "application/json",
		data : JSON.stringify(orderArray),
		success : function(data){
			if(data == true){
				alert("주문이 완료되었습니다.");
				location.href = "/point/cafe";
			}else{
				alert("주문 실패!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}













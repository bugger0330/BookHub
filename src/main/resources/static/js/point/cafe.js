const coffieCheck = document.querySelectorAll(".menu--checkbox--coffie");
const coffieCount = document.querySelectorAll(".coffie--count");
const coffiePrice = document.querySelectorAll(".menu--price--coffie");
const myPoint = document.querySelector(".mypoint");
const priceAll = document.querySelector(".price--all");
const orderBtn = document.querySelector(".order--btn");
const productName = document.querySelectorAll(".product--name");

const username = "user1";
/**
 * 페이지 로드시 내 포인트 들고옴
 * 
 * 체크박스 클릭 이벤트가 일어날 때마다 각 메뉴 가격*갯수들 다 더해서 총합을 계산
 * 
 * 결제버튼 클릭시 로그인 안되어 있으면 로그인부터 해야함.
 * 결제버튼 클릭시 마이포인트가 적으면 결제안됨, 포인트 결제 페이지로?
 * 
 * 총결제금액--
 * 메인함수 - 체크박스 체크 이벤트
 * 서브함수 - 체크된 곳 금액 * 갯수
 */

load();
function load(){
	
	//myPoint.textContent = 0;
	if(username == ""){
		// 로그인이 필요합니다 출력(내 포인트: <<==여기에)
		
	}
	$.ajax({
		type : "post",
		url : "/point/get",
		data : {
			userName : username
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
	// 주문하기
	let orderArray = new Array();
	
	for(let i = 0; i < coffieCheck.length; i++){
		if(coffieCheck[i].checked == true && coffieCount[i].value != 0){
			const orders = {
				productName : productName[i].textContent,
				productPrice : Number(coffiePrice[i].textContent),
				productCount : coffieCount[i].value,
				allProductPrice : (Number(coffiePrice[i].textContent) * Number(coffieCount[i].value)),
				userName : username,
				orderId : -1,
				refund_type : "환불가능"
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
			}else{
				alert("주문 실패!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}













const printInput = document.querySelectorAll(".point--print--print-input");
const printAllCount = document.querySelector(".point--print--count");
const myPoint = document.querySelector(".point--print--mypoint");
const priceAll = document.querySelector(".point--print--allpoint");
const printBtn = document.querySelector(".point--print--print-btn");



load();
function load(){
	
	printAllCount.textContent = 0;
	
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

for(let i = 0; i < printInput.length; i++){ // input onchange
	printInput[i].onchange = () => {
		if(printInput[i].value < 0){
			printInput[i].value = 0;
		}
		allPoint = checkTrue();
		priceAll.textContent = allPoint;
		// 갯수 리턴받아서 보여줘야함
		all = countPlus();
		printAllCount.textContent = all;
		return;
	}
}

function multiplyFun(count){
	return 60 * Number(count);
}

function checkTrue(){
	let allPoint = 0;
	for(let k = 0; k < printInput.length; k++){
		let multiply2 = multiplyFun(printInput[k].value);
		allPoint += Number(multiply2);
	}
	return allPoint;
}

function countPlus(){
	let all = 0;
	for(let v = 0; v < printInput.length; v++){
		all += Number(printInput[v].value);
	}
	return all;
}

printBtn.onclick = () => {
	if(memberId == ""){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/login";
		return;
	}
	
	if(printAllCount.textContent == 0){
		alert("프린트/복사 장 수를 입력해주세요!");
		return;
	}
	
	if(Number(myPoint.textContent) < Number(priceAll.textContent)){
		alert("포인트가 부족합니다!");
		return;
	}
	
	let orderArray = new Array();
	const orders = {
		productName : "복사/프린트",
		productPrice : 60,
		productCount : Number(printAllCount.textContent),
		allProductPrice : Number(priceAll.textContent),
		userName : memberId,
		orderId : -1,
		refundType : "환불불가"
	};
	orderArray.push(orders);

	$.ajax({
		type : "post",
		url : "/point/order",
		contentType : "application/json",
		data : JSON.stringify(orderArray),
		success : function(data){
			if(data == true){
				alert("주문이 완료되었습니다.");
				location.href = "/point/print";
			}else{
				alert("주문 실패!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}























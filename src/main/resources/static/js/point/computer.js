const com1 = document.querySelectorAll(".com1");
const computerNum = document.querySelector(".computer-num"); // 컴퓨터 인덱스번호 + 1
const mypointSpan = document.querySelector(".myp");
const innerFlag = document.querySelector(".inner-flag");
const orderPrice = document.querySelector(".order-price");
const orderBtn = document.querySelector(".use-btn");
let play = 0;
let statusData = null;
let myPoint = 0;
const now = new Date();

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
				mypointSpan.textContent = data;
				myPoint = data;
			}
		},
		error : function(){
			alert("에러");
		}
	});
	
	$.ajax({
		type : "get",
		url : "/point/computer/used",
		success : function(data){
			usedComputerList(data);
			statusData = data;
		},
		error : function(){
			alert("에러");
		}
	});
}


function usedComputerList(data){
	if(data != ""){
		for(let i = 0; i < data.length; i++){
			const comTime = new Date(data[i].endTime);
			if(now > comTime){
				com1[data[i].comNumber - 1].style.backgroundColor = "blue";
			}else{
				com1[data[i].comNumber - 1].style.backgroundColor = "red";
			}
		}
	}
}

for(let i = 0; i < com1.length; i++){
	com1[i].onclick = () => {
		let innr = "";
		if(com1[i].style.backgroundColor == "blue" || com1[i].style.backgroundColor == "green"){
			innr = `
				<div class="computer-info-area">
	                <div class="info-title-area">
	                    <span class="flag">사용가능</span>
	                </div>
	                <div class="computer-info">
	                    <div class="com1-info">
	                        <span class="computer-num">${i + 1}</span>
	                        <span>번 컴퓨터</span>
	                    </div>
	                    <div class="com1-time">
	                        <span>사용시간 :</span>
	                        <input type="number" value="0" class="play-time">
	                        <span>시간</span>
	                    </div>
	                </div>
	            </div>
			`;
			innerFlag.innerHTML = innr
			const flagColor = document.querySelector(".flag");
			flagColor.style.color = "green";
			const playTime = document.querySelector(".play-time");
			timeChangeEvent(playTime, com1[i]);
		}else{
			innr = `
				<div class="computer-info-area">
	                <div class="info-title-area">
	                    <span class="flag">사용중</span>
	                </div>
	                <div class="computer-info">
	                    <div class="com1-info">
	                        <span class="computer-num">${i + 1}</span>
	                        <span>번 컴퓨터</span>
	                    </div>
	                    <div class="com1-time">
	                        <span style="margin-right:20px;">종료시간 :</span>
	                        <span>${statusData[i].endTime}</span>
	                    </div>
	                </div>
	            </div>
			`;
			innerFlag.innerHTML = innr;
			const flagColor = document.querySelector(".flag");
			flagColor.style.color = "red";
		}
	}
}

function timeChangeEvent(input, data){
	input.onchange = () => {
		price = 0;
		if(input.value < 0){
			input.value = 0;
		}
		if(input.value > 3){
			alert("최대 3시간 까지만 사용 가능합니다.");
			input.value = 3;
		}
		if(input.value > 0){
			data.style.backgroundColor = "green";
		}
		price = calc(input.value);
		orderPrice.textContent = price;
		play = Number(input.value);
	}
}

function calc(num){
	let price = 0;
	price = num * 500;
	return price;
}

orderBtn.onclick = () => {
	
	if(memberId == ""){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/login";
		return;
	}
	
	if( Number(mypointSpan.textContent) < Number(orderPrice.textContent) ){
		alert("포인트가 부족합니다.");
		return;
	}
	if(orderPrice.textContent == ""){
		alert("사용하실 컴퓨터를 선택해주세요!");
		return;
	}
	const arr = new Array();
	for(let k = 0; k < com1.length; k++){
		let orderEntity = {
			comNumber : (k + 1),
			time : 0,
			status : 0,
			flag : 0
		};
		if(com1[k].style.backgroundColor == "blue"){
			arr.push(orderEntity);
		}else if(com1[k].style.backgroundColor == "green"){
			orderEntity.comNumber = (k + 1);
			orderEntity.time = play;
			orderEntity.status = 1;
			orderEntity.flag = 1;
			arr.push(orderEntity);
		}else{
			orderEntity.flag = 2;
		}
	}// for(let k
	
	console.log(arr);

	$.ajax({
		type : "put",
		url : "/point/computer/use-flag",
		contentType : "application/json",
		data : JSON.stringify(arr),
		success : function(data){
			if(data == true){
				myOrderUpdate();
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

function myOrderUpdate(){
	const orderArray = new Array();
	const orders = {
		productName : "PC 사용",
		productPrice : 500,
		productCount : play,
		allProductPrice : Number(orderPrice.textContent),
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
				location.href = "/point/computer";
			}else{
				alert("주문 실패!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}






















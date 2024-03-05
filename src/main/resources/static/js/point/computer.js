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

// 사용불가 컴퓨터는 아이콘을 빨간색으로 변경
// 사용불가 시 디비에 저장된 사용기간을 가져와서 현재시간과 계산해서 사용가능한지 여부
// com1 클릭시마다 innerHtml로 상태 변경
// mypoint 는 한번만 가져와서 헤더에 세팅 - 변수에 담아놓기! 동기처리

load();
function load(){
	
	//myPoint.textContent = 0;
	if(memberId == ""){
		// 로그인이 필요합니다 출력(내 포인트: <<==여기에)
		
	}
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
	
	// 현재 컴퓨터 사용자 리스트 불러오기
	// 컴퓨터 예약할 때 사용시간이 끝난 컴퓨터는 종료시키기(list로 업데이트)
	
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
			// 현재시각이랑 남은시각 비교
			const comTime = new Date(data[i].endTime);
			if(now > comTime){
				com1[data[i].comNumber - 1].style.backgroundColor = "blue";
			}else{
				com1[data[i].comNumber - 1].style.backgroundColor = "red";
			}
		}
	}
}

// flagColor 
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
				// 포인트 사용 내역 추가
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
		refund_type : "환불불가"
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






















const tbody = document.querySelector(".point--order--tbody");
const refundTrueCheck = document.querySelectorAll(".point--order--check");
let username = "user1";

load();
function load(){
	if(username == ""){
		// 로그인이 필요합니다 출력(내 포인트: <<==여기에)
	}
	$.ajax({
		type : "get",
		url : "/point/my-order-list",
		data : {
			username : username
		},
		success : function(data){
			if(data != ""){
				innerFun(data);
				checkEvent(data);
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
		innr += `
			<tr class="point--order--tr">
	            <td class="point--order--td">${data[i].productName}</td>
	            <td class="point--order--td">${data[i].productPrice}</td>
	            <td class="point--order--td">${data[i].productCount}</td>
	            <td class="point--order--td">${data[i].allProductPrice}</td>
	            <td class="point--order--td">${data[i].rdate}</td>
	            <td class="point--order--td">${data[i].refundType}</td>
	            <td class="point--order--td">
	                <button type="button" class="point--order--refund-btn" id="${data[i].id}">환불</button>
	            </td>
	        </tr>
		`;
	}
	tbody.innerHTML = innr;
	const refundBtns = document.querySelectorAll(".point--order--refund-btn");
	refundButtonCss(refundBtns, data);
	refundEvent(refundBtns, data);
}

function refundButtonCss(btns, data){
	for(let i = 0; i < data.length; i++){
		if(data[i].refundType == "환불불가" || data[i].refundType == "환불완료"){
			btns[i].style.display = "none";
		}
	}
}

function checkEvent(data){
	refundTrueCheck[0].onchange = () => {
		if(refundTrueCheck[0].checked == true){
			refundTrueCheck[1].checked = false;
			tbody.textContent = "";
			let innr = "";
			for(let i = 0; i < data.length; i++){
				if(data[i].refundType == "환불가능"){
					innr += `
						<tr class="point--order--tr">
				            <td class="point--order--td">${data[i].productName}</td>
				            <td class="point--order--td">${data[i].productPrice}</td>
				            <td class="point--order--td">${data[i].productCount}</td>
				            <td class="point--order--td">${data[i].allProductPrice}</td>
				            <td class="point--order--td">${data[i].rdate}</td>
				            <td class="point--order--td">${data[i].refundType}</td>
				            <td class="point--order--td">
				                <button type="button" class="point--order--refund-btn" id="${data[i].id}">환불</button>
				            </td>
				        </tr>
					`;
				}
				
			}
			tbody.innerHTML = innr;
		}else{
			load();
		}
	}
	refundTrueCheck[1].onchange = () => { // 환불완료
		tbody.textContent = "";
		let innr = "";
		if(refundTrueCheck[1].checked == true){
			refundTrueCheck[0].checked = false;
			for(let i = 0; i < data.length; i++){
				if(data[i].refundType == "환불완료"){
					innr += `
						<tr class="point--order--tr">
				            <td class="point--order--td">${data[i].productName}</td>
				            <td class="point--order--td">${data[i].productPrice}</td>
				            <td class="point--order--td">${data[i].productCount}</td>
				            <td class="point--order--td">${data[i].allProductPrice}</td>
				            <td class="point--order--td">${data[i].rdate}</td>
				            <td class="point--order--td">${data[i].refundType}</td>
				            <td class="point--order--td">
				                <button type="button" class="point--order--refund-btn" id="${data[i].id}">환불</button>
				            </td>
				        </tr>
					`;
				}
			}
			tbody.innerHTML = innr;
			const refundBtns = document.querySelectorAll(".point--order--refund-btn");
			refundButtonCss(refundBtns, data);
		}else{
			load();
		}
	}
}

function refundEvent(btns, datas){
	for(let i = 0; i < btns.length; i++){
		btns[i].onclick = () => {
			$.ajax({
				type : "post",
				url : "/point/order/refund",
				data : {
					id : btns[i].id
				},
				success : function(data){
					if(data == true){
						//마이포인트 업데이트
						mypointUpdate(datas[i]);
					}
				},
				error : function(){
					alert("에러");
				}
			});
		}
	}
}

function mypointUpdate(data){
	$.ajax({
		type : "post",
		url : "/point/mypoint/refund",
		data : {
			userName : username,
			allProductPrice : data.allProductPrice
		},
		success : function(data){
			if(data == true){
				alert("환불완료!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}
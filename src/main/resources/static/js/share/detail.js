const setImg = document.querySelector(".book--detail--img");
const bookInfos = document.querySelectorAll(".book--detail--info--content");
const tbody = document.querySelector(".book--detail--tbody");
const modalTable = document.querySelector(".modal--table");
const mypoint = document.querySelector(".book--detail--mypoint");
const calcPrice = document.querySelector(".book--detail--calc-price");
const borrowDay = document.querySelector(".book--detail--order-date");

let addressNum = location.pathname.split("/")[3];

let masterUsername = "";
load();
function load(){
	calcPrice.textContent = "100";
	
	$.ajax({
		type : "get",
		url : `/share/info/${addressNum}`,
		success : function(data){
			if(data != ""){
				innerFun(data);
				masterUsername = data.userName;
			}else{
				alert("잘못된 접근입니다.");
				location.href = "/share/read";
			}
		},
		error : function(){
			alert("에러");
		}
	});
	
	$.ajax({
		type : "post",
		url : "/point/get",
		data : {
			userName : memberId
		},
		success : function(data){
			if(data != null){
				mypoint.textContent = data;
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

borrowDay.onchange = () => {
	if(borrowDay.value < 0){
		borrowDay.value = 0;
	}
	if(borrowDay.value > 7){
		alert("최대 7일동안 대출 하실 수 있습니다.");
		borrowDay.value = 7;
	}
	let calcResult = calc(borrowDay.value);
	calcPrice.textContent = calcResult;
}

function calc(day){
	let calc = day * 100;
	return calc;
}

function innerFun(data){
	if(data != null){
		setImg.src = "/images/upload/" + data.file;
		bookInfos[0].textContent = data.bookName;
		bookInfos[1].textContent = data.writer;
		bookInfos[2].textContent = `${data.company}, 1982, 인쇄자료(책자형), 2950`;
		
		let innr = `
			<tr>
                <td class="book--detail--td">${data.id}</td>
                <td class="book--detail--td">본관2층 자유열람실</td>
                <td class="book--detail--td">${data.wdate}</td>
                <td class="book--detail--td book--detail--table--color">${data.status}</td>
            </tr>
		`;
		tbody.innerHTML = innr;
		const boardTd = document.querySelectorAll(".book--detail--td");
		buttonClickEvent(boardTd, data);
	}
}

function buttonClickEvent(boardTd, bookEntity){
	const borrowBtns = document.querySelectorAll(".book--detail--button");
	const calcDiv = document.querySelector(".book--detail--order-box");
	const borrowBtn = document.querySelector(".borrow-btn");
	
	const now = new Date();
	const comTime = new Date(bookEntity.wdate);
	const dayTime = 60 * 60 * 24;
	
	borrowBtns[0].onclick = () => {
		calcDiv.style.display = "flex";
	}
	
	borrowBtn.onclick = () => {
		if(memberId != ""){
			if(memberId == bookEntity.userName){
				alert("본인의 책은 대출이 불가능합니다.");
				return;
			}else{
				$.ajax({
					type : "post",
					url : "/share/borrow",
					data : {
						bookId : Number(boardTd[0].textContent),
						userName : memberId,
						borrowDay : borrowDay.value,
					},
					success : function(data){
						if(data == true){
							let result = orderUpdate(borrowDay.value, lateCalc(borrowDay.value), "공유 책 대출");
								if(result == true){
									payment(Number(calcPrice.textContent));
								}
						}else{
							alert("대출실패!");
						}
					},
					error : function(){
						alert("에러");
					}
				});
			}
		}else{
			alert("로그인이 필요한 서비스 입니다.");
			window.location.href = "/login";
		}
	}
	
	function payment(point){
		$.ajax({
			type : "put",
			url : "/share/payment",
			data : {
				point : point,
				masterUsername : masterUsername,
				userName : memberId
			},
			success : function(data){
				if(data == true){
					alert("대출완료!");
					window.location.href = `/share/detail/${addressNum}`;
				}else{
					alert("대출실패!");
				}
			},
			error : function(){
				alert("에러");
			}
		});
	}
	
	borrowBtns[1].onclick = () => { 
		if(memberId != ""){
			if(boardTd[2].textContent != ""){
				let lateDays = Math.floor(+ now / 1000 / dayTime) - Math.floor(+ comTime / 1000 / dayTime) + 1;
				let latePoint = lateCalc(lateDays);// 연체금액
				if(now.getTime() > comTime.getTime()){
					if(confirm(`책이 연체되었습니다. 연체금 ${latePoint} P 를 지불하시겠습니까?`)){
						if(Number(mypoint.textContent) < latePoint){
							alert("포인트가 부족하여 책 반납을 할 수 없습니다.");
							if(confirm("포인트 결제 페이지로 이동하시겠습니까?")){
								window.location.href = "/point-shop";
							}
						}
						$.ajax({
							type : "delete",
							url : "/share/borrow-return",
							data : {
								bookId : Number(boardTd[0].textContent),
								userName : memberId
							},
							success : function(data){
								if(data == true){
									let result = orderUpdate(lateDays, latePoint, "공유 책 반납");
									if(result == true){
										alert("반납이 완료되었습니다.");
										location.href = `/share/detail/${addressNum}`;
									}
								}else{
									alert("반납실패!");
								}
							},
							error : function(){
								alert("에러");
							}
						});
					}
				}else{
					$.ajax({
						type : "delete",
						url : "/share/borrow-return",
						data : {
							bookId : Number(boardTd[0].textContent),
							userName : memberId
						},
						success : function(data){
							if(data == true){
								alert("반납이 완료되었습니다.");
								location.href = `/share/detail/${addressNum}`;
							}else{
								alert("반납실패!");
							}
						},
						error : function(){
							alert("에러");
						}
					});
				}
			}else{
				alert("반납할 책이 없습니다.");
				return;
			}
		}else{
			alert("로그인이 필요한 서비스 입니다.");
			window.location.href = "/login";
		}
	}
	
	const modal = document.querySelector('.modal');
	const modalPrint = document.querySelector(".modal--print--btn");
	const modalClosed = document.querySelector(".modal--closed--btn");
    borrowBtns[2].onclick = () => {
		modal.style.display="flex";
		let modalVal = `
			<tr>
	            <th class="modal--table--th">제 목 :</th>
	            <td class="modal--table--td">${bookEntity.bookName}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">저 자 :</th>
	            <td class="modal--table--td">${bookEntity.writer}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">발행사항 :</th>
	            <td class="modal--table--td">${bookEntity.company}, 1982, 인쇄자료(책자형), 2950</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">등록번호 :</th>
	            <td class="modal--table--td">${bookEntity.id}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">자료실 :</th>
	            <td class="modal--table--td">본관2층 자유열람실</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">서가번호 :</th>
	            <td class="modal--table--td">31B</td>
	        </tr>
		`;
		modalTable.innerHTML = modalVal;
	}
	
	modalClosed.onclick = () => {
		modal.style.display="none";
	}
	
	modalPrint.onclick = () => { // 프린트기능
		let printData = `
			<tr>
	            <th class="modal--table--th">제 목 :</th>
	            <td class="modal--table--td">${bookEntity.bookName}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">저 자 :</th>
	            <td class="modal--table--td">${bookEntity.writer}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">발행사항 :</th>
	            <td class="modal--table--td">${bookEntity.company}, 1982, 인쇄자료(책자형), 2950</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">등록번호 :</th>
	            <td class="modal--table--td">${bookEntity.id}</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">자료실 :</th>
	            <td class="modal--table--td">본관2층 자유열람실</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">서가번호 :</th>
	            <td class="modal--table--td">31B</td>
	        </tr>
	        <tr>
	            <th class="modal--table--th">위치 :</th>
	            <td class="modal--table--td">
	            	<img alt="대출장소" src="/img/book/31b.png" class="modal--img">
	            </td>
	        </tr>
	        `;
		
	    const createTag = window.open('', 'print', '');
	    createTag.document.write('<!DOCTYPE html>');
	    createTag.document.write('<html><head><title>' + "print"  + '</title><link rel="stylesheet" href="/css/book/bookDetail.css"/>');
	    createTag.document.write('</head><body><table class="modal--table">');
	    createTag.document.write(printData);
	    createTag.document.write('</table></body></html>');
	    setTimeout(function() {
		    createTag.print();
	    	//createTag.close();
		}, 100);


	}
	
}

function lateCalc(lateDays){
	let latePoint = lateDays * 100;
	return latePoint;
}

function orderUpdate(lateDays, latePoint, productName){
	let flag = false;
	const orderArray = new Array();
	const orders = {
		productName : productName,
		productPrice : 100,
		productCount : lateDays,
		allProductPrice : latePoint,
		userName : memberId,
		orderId : -1,
		refundType : "환불불가"
	};
	orderArray.push(orders);
	$.ajax({
		type : "post",
		url : "/point/order",
		contentType : "application/json",
		async : false,
		data : JSON.stringify(orderArray),
		success : function(data){
			if(data == true){
				flag = true;
			}else{
				alert("반납 실패!");
			}
		},
		error : function(){
			alert("에러");
		}
	});
	return flag;
}
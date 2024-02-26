const setImg = document.querySelector(".book--detail--img");
const bookInfos = document.querySelectorAll(".book--detail--info--content");
const tbody = document.querySelector(".book--detail--tbody");


load();
function load(){
	let addressNum = location.pathname.split("/")[3];;
	console.log(addressNum);
	$.ajax({
		type : "get",
		url : `/book/info/${addressNum}`,
		success : function(data){
			if(data != null){
				innerFun(data);
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

function innerFun(data){
	if(data != null){
		setImg.src = data.img;
		bookInfos[0].textContent = data.bookName;// 제목
		bookInfos[1].textContent = data.writer;// 작가
		bookInfos[2].textContent = `${data.company}, 1982, 인쇄자료(책자형), 2950`;// 작가
		
		let innr = `
			<tr>
                <td class="book--detail--td">${data.id}</td>
                <td class="book--detail--td">본관2층 자유열람실</td>
                <td class="book--detail--td">${data.wdate}</td>
                <td class="book--detail--td book--detail--table--color">${data.status}</td>
            </tr>
		`;
		//BUR1000234
		//
		//2024.3.1
		//대출불가
		tbody.innerHTML = innr;
		// 대출, 반납 버튼 숨김 기능 추가해야함
		const boardId = document.querySelectorAll(".book--detail--td");
		buttonClickEvent(boardId[0].textContent);
	}
}

// 일단 로그인 된 상태로 가정하고 대출하기, 반납하기 기능 구현함.
// 회원정보 가져와서 만약 빌린 책이면 대출하기 버튼은 숨김 - 반대도 가능해야함
let username = "abc123";// 세션에서 유저정보 가져왔다고 가정하고

function buttonClickEvent(bookId){
	console.log("반납 클릭");
	const borrowBtns = document.querySelectorAll(".book--detail--button");
	
	// 대출, 반납버튼을 숨기게 되면 인덱스로 클릭이벤트 처리 할 수 없음!
	borrowBtns[0].onclick = () => { // 대출하기
	if(username != ""){
		// 테이블명 : bh_book_borrow(대출) - 대출정보 등록
		// 북 테이블에 상태값도 변경해야함
		$.ajax({
			type : "post",
			url : "/book/borrow",
			data : {
				bookId : bookId,
				username : username
			},
			success : function(data){
				if(data == true){
					alert("대출완료!");
				}else{
					alert("대출실패!");
				}
			},
			error : function(){
				alert("에러");
			}
		});
	}
}
}




























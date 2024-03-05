/**
 * 아이디 찾기 결과
 */

 const email = localStorage.getItem('email');
	const backgroundDiv = document.querySelector('.result-id > ul');
	let uidArray = new Array();
	
	// 페이지 로드 후 적용
	document.addEventListener('DOMContentLoaded', function() {
		load();
	});
	
	
	function load() {
		fetch('/user/findUids',{
			method: "POST",
			headers: {
				"Content-Type": "application/json;charset=UTF-8",
			},
			body: JSON.stringify({
			    email: email,
			}),
		}).then((response) => response.json())
		.then((data) => {
			console.log('response : '+data);
						
			uidLoad(data);
		})
		.catch((error) => {
			console.log(error);
		});
		
		
		localStorage.removeItem("email");
	}
	
	// 태그 생성
	function uidLoad(data) {
		console.log('count : '+data.length);
		
		if(data != null && data.length > 1){
			console.log('true');
			
			for (let i = 0; i < data.length; i++) {
				const liTag = '<li>'+data[i]+'</li>';
				backgroundDiv.insertAdjacentHTML("afterbegin",liTag);
			}
		} else {
			console.log('false');
			const notDataliTag = '<li style="list-style: none;">아이디가 존재하지 않습니다.</li>';
			backgroundDiv.insertAdjacentHTML("afterbegin", notDataliTag);
		}
	}
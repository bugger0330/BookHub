/*
* 약관 동의, 약관 전체 체크
*/


const checkboxes = document.querySelectorAll('.term-box');
const checked = document.querySelectorAll('input[name="termbox"]:checked');
const allChcking = document.querySelector('input[name="allChcking"]');
const btnNext = document.getElementById('btn-next');

// 전체 체크 확인
function checkSelectAll() {
	if(checkboxes.length === checked.length)  {
		allChcking.checked = true;
	}else {
		allChcking.checked = false;
	}
}

// 모두 체크
function selectAll(all) {
	checkboxes.forEach((checkbox)=>{
		checkbox.checked = all.checked
	});
}

// 페이지 이동
btnNext.addEventListener('click', function(e){
	const checkedbox = document.querySelectorAll('input[name="termbox"]:checked');
	if(checkboxes.length !== checkedbox.length){
		alert('모든 약관에 동의해주세요.')
	} else {
		window.location.href = '/user/signUp';
	}
});
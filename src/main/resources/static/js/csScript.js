window.onload = () => {
  // panel-faq-container
  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
  
  // panel-faq-answer
  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

  // btn-all-close
  const btnAllClose = document.querySelector("#btn-all-close");
  
  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
  for( let i=0; i < panelFaqContainer.length; i++ ) {
    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
      panelFaqAnswer[i].classList.toggle('activeFaq');
    });
  };
  
  btnAllClose.addEventListener('click', function() {
    // 버튼 클릭시 처리할 일  
    for(let i=0; i < panelFaqAnswer.length; i++) {
        panelFaqAnswer[i].classList.remove('activeFaq');
    };
  });
}
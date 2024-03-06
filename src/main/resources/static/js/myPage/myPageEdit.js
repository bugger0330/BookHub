// 주소찾기 버튼 클릭 이벤트 핸들러
$('#find-address-btn').on('click', function() {
    new daum.Postcode({
        oncomplete : function(data) {
            // 주소 검색 결과가 선택되었을 때 실행되는 부분
            // 검색 결과를 사용자가 선택한 값을 입력 폼에 채워넣는 등의 동작을 여기에 추가할 수 있습니다.
            $('#zip').val(data.zonecode); // 우편번호 입력 폼에 우편번호 값 채우기
            $('#addr1').val(data.address); // 주소 입력 폼에 주소 값 채우기
            $('#addr2').focus(); // 상세 주소 입력란으로 포커스 이동
        }
    }).open();
});

$(document).ready(function() {
    // 수정하기 버튼 폼 검증
    $('#edit-btn').on('submit', function(event) {
        var isValid = true;

        // 이름 유효성 검사
        var name = $('#name').val();
        if (!name.match(/^[A-Za-z가-힣]+$/)) {
            $('#name-error').text('이름은 영어 또는 한글만 입력 가능합니다.');
            $('#name').addClass('is-invalid');
            isValid = false;
        } else {
            $('#name-error').text('');
            $('#name').removeClass('is-invalid');
        }

        // 이메일 유효성 검사
        var email = $('#email').val();
        if (!validateEmail(email)) {
            $('#email-error').text('유효한 이메일 형식이 아닙니다.');
            $('#email').addClass('is-invalid');
            isValid = false;
        } else {
            $('#email-error').text('');
            $('#email').removeClass('is-invalid');
        }

        // 전화번호 유효성 검사
        var phone = $('#phone').val();
        if (!phone.match(/^\d{3}-\d{3,4}-\d{4}$/)) {
            $('#phone-error').text('유효한 전화번호 형식을 입력하세요. (예: 010-1234-5678)');
            $('#phone').addClass('is-invalid');
            isValid = false;
        } else {
            $('#phone-error').text('');
            $('#phone').removeClass('is-invalid');
        }

        // 유효성 검사 결과에 따라 폼 제출 여부 결정
        if (!isValid) {
            event.preventDefault(); // 폼 제출 방지
        } else {
            // 유효성 검사가 통과되었을 때
            alert("수정이 완료되었습니다.");
        }
    });
    
    // 이메일 유효성 검사 함수
function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}


// 회원탈퇴 버튼 클릭 이벤트 핸들러
$('#delete-btn').on('click', function(event) {
    // confirm 창 표시
    var confirmDelete = confirm("정말로 회원을 탈퇴하시겠습니까?");
    if (confirmDelete) { // 확인 버튼을 클릭한 경우
        // alert 창 표시
        alert("회원탈퇴가 완료됐습니다.");
        // 폼 제출
        $('#delete-form').submit();
    } else {
        // 취소한 경우 아무 작업도 하지 않음
    }
    // 기본 이벤트 동작 방지
    event.preventDefault();
});

});


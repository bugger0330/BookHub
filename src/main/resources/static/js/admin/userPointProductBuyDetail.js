$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn").click(function() {
        if (confirm("수정하시겠습니까?")) {
        	
            $("#edit-btn-form").submit();
            
        }
    });

    // 삭제 버튼 클릭 시
    $("#deleteBtn").click(function() {
        if (confirm("삭제하시겠습니까?")) {
        	
            $("#delete-btn-form").submit();
          
        }
    });
    
    
    

    // 폼 유효성 검사 및 숫자만 입력 체크
    $("#edit-btn-form").submit(function() {
        let price = $("#price").val();
        let point = $("#point").val();

        if (isNaN(price) || isNaN(point)) {
            alert("가격과 포인트는 숫자만 입력해주세요.");
            return false;
        }

       

        return true;
    });
});
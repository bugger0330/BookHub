$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn").click(function() {
        if (confirm("수정하시겠습니까?")) {
        	alert("수정되었습니다.");
            $("#edit-btn-form").submit();
            
        }
    });

    // 삭제 버튼 클릭 시
    $("#deleteBtn").click(function() {
        if (confirm("삭제하시겠습니까?")) {
        		alert("삭제되었습니다.");
            $("#delete-btn-form").submit();
          
        }
    });
    
    
    

    // 폼 유효성 검사 및 숫자만 입력 체크
    $("#edit-btn-form").submit(function() {
        var point = $("#point").val();

        if (isNaN(point)) {
            alert("가격과 포인트는 숫자만 입력해주세요.");
            return false;
        }

        // 이미지 업로드 체크
        var fileInput = $("#productImage");
        if (fileInput.val() === "") {
            alert("이미지를 업로드해주세요.");
            return false;
        }

        return true;
    });
});
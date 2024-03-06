let bannerId = document.getElementById('bannerid').value;
$(document).ready(function() {
    // 수정하기 버튼 클릭 시
    $('#edit-btn').submit(function(event) {
        event.preventDefault();
        
        /// 이미지를 선택하지 않은 경우
	        if ($('#bannerImage').val() == '') {
	            alert('이미지를 선택해주세요.');
	            return false; // 폼 제출 취소
	        }

	        // FormData 객체 생성
	        let formData = new FormData();
	        formData.append('title', $('#title').val());
	        formData.append('content', $('#content').val());
	        formData.append('writer', $('#writer').val());
	        formData.append('postYn', $('input[name=postYn]:checked').val());
	        formData.append('bannerImage', $('#bannerImage')[0].files[0]); // 파일 추가

	        // AJAX를 사용하여 수정 요청 전송
	        $.ajax({
	            type: 'PUT',
	            url: '/ad/edit/' + bannerId,
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	                // 수정 성공 시 처리
	                alert('수정되었습니다.');
	                window.location.href = '/ad/list';
	            },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error(xhr.responseText);
	            }
	        });
    });

    // 삭제 버튼 클릭 시 얼럿창 표시
	    $('#delete-btn').submit(function(event) {
	        event.preventDefault();

	        let confirmation = confirm("광고를 삭제하시겠습니까?");

	        if (confirmation) {
	            // 확인을 눌렀을 때
	            $.ajax({
	                type: 'DELETE',
	                url: '/ad/delete/' + bannerId,
	                success: function(response) {
	                    alert('삭제되었습니다.');
	                    window.location.href = '/ad/list';
	                },
	                error: function(xhr, status, error) {
	                    console.error(xhr.responseText);
	                }
	            });
	        } else {
	            // 취소를 눌렀을 때
	            return false;
	        }
	    });
});

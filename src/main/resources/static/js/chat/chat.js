
	$(function() {
	    var stompClient = null;
	    const modal = $('.modal');
	    const btnOpenModal = $('.btn--chatbot');

	    // 소켓 연결 함수
	    function connectWebSocket() {
	        var socket = new SockJS('/ws');
	        stompClient = Stomp.over(socket);
	        stompClient.connect({}, function(frame) {
	            $("#connect").prop("disabled", true);
	            $("#disconnect").prop("disabled", false); // 연결 후에 해제 버튼 활성화
	            $("#send").prop("disabled", true); // 연결 후에도 초기에 전송 버튼 비활성화
	            $("#chat-room").show();
	            console.log('Connected: ' + frame);
	            stompClient.subscribe('/topic/public', function(message) {
	                showMessage("💡💬 : " + message.body);
	            });
	        });
	    }

	 // 입력 필드에서 엔터 키 누를 때 메시지 전송
	    $('#msg').on('keyup', function(event) {
	        // 엔터 키가 눌렸을 때
	        if (event.keyCode === 13) {
	            // 메시지 전송 버튼 클릭
	            $('#send').click();
	        }
	    });

	    
	    // 연결 버튼 클릭 이벤트 처리
	    $("#connect").click(function() {
	        connectWebSocket(); // 소켓 연결 함수 호출
	    });

	    // 연결 해제 버튼 클릭 이벤트 처리
	    $("#disconnect").click(function() {
	        if (stompClient !== null) {
	            stompClient.disconnect();
	            $("#connect").prop("disabled", false);
	            $("#disconnect").prop("disabled", true);
	            $("#send").prop("disabled", true);
	            $("#chat-room").hide();
	            console.log("Disconnected");
	            stompClient = null;
	        }
	    });

	    // 입력 필드의 입력 이벤트 처리
	    $('#msg').on('input', function() {
	        // 입력 필드의 값이 비어 있는지 확인
	        $('#send').prop('disabled', $(this).val().trim() === '');
	    });

	    // 메시지 전송 버튼 클릭 이벤트 처리
	    $('#send').click(function() {
	        // 메시지 전송 로직 수행
	        var message = $('#msg').val();
	        $('#msg').val('');
	        $('#communicate').append('<tr><td>🧑💬 : ' + message + '</td></tr>');
	        stompClient.send('/app/sendMessage', {}, message);
	        $("#send").prop("disabled", true); // 전송 후에 전송 버튼 다시 비활성화
	    });

	    // 채팅 내용을 표시하는 함수
	    function showMessage(message) {
	        $("#communicate").append("<tr><td>" + message + "</td></tr>");
	    }

	    // 모달 열기/닫기 버튼 클릭 이벤트 처리
	    btnOpenModal.click(function() {
	        if (modal.is(':visible')) { // 모달이 열려있는 경우
	            modal.hide(); // 모달 숨기기
	            // 웹소켓 연결 해제
	            disconnectWebSocket(); // 연결 해제 함수 호출
	            btnOpenModal.find('i').removeClass('bi bi-x-circle').addClass('bi bi-chat-dots-fill');
	        } else { // 모달이 닫혀있는 경우
	            modal.show(); // 모달 보이기
	            if (!stompClient) {
	                connectWebSocket(); // 웹소켓 연결 설정 (한 번만)
	            }
	            btnOpenModal.find('i').removeClass('bi bi-chat-dots-fill').addClass('bi bi-x-circle');
	        }
	    });

	    // 모달 닫힐 때 연결 해제 함수
	    modal.on('hide.bs.modal', function (e) {
	        // 모달이 닫힐 때 연결 해제 함수 호출
	        disconnectWebSocket();
	    });

	    // 웹소켓 연결 해제 함수
	    function disconnectWebSocket() {
	        if (stompClient !== null) {
	            stompClient.disconnect();
	            $("#connect").prop("disabled", false);
	            $("#disconnect").prop("disabled", true);
	            $("#send").prop("disabled", true);
	            $("#chat-room").hide();
	            console.log("Disconnected");
	            stompClient = null;
	        }
	    }
	});


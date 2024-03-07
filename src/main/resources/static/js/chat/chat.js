	$(function() {
	    var stompClient = null;
	    const modal = $('.modal-chat');
	    const btnOpenModal = $('.btn--chatbot');

	    // 소켓 연결 함수
	    function connectWebSocket() {
	        var socket = new SockJS('/ws');
	        stompClient = Stomp.over(socket);
	        stompClient.connect({}, function(frame) {
	            $("#connect").prop("disabled", true);
	            $("#disconnect").prop("disabled", false);
	            $("#send").prop("disabled", true);
	            $("#chat-room").show();
	            stompClient.subscribe('/topic/public', function(message) {
	                showMessage("💡💬 : " + message.body);
	            });
	        });
	    }

	    // 연결 버튼 클릭 이벤트 처리
	    $("#connect").click(function() {
	        connectWebSocket();
	    });

	    // 연결 해제 버튼 클릭 이벤트 처리
	    $("#disconnect").click(function() {
	        if (stompClient !== null) {
	            stompClient.disconnect();
	            $("#connect").prop("disabled", false);
	            $("#disconnect").prop("disabled", true);
	            $("#send").prop("disabled", true);
	            $("#chat-room").hide();
	            stompClient = null;
	        }
	    });

	    // 입력 필드의 입력 이벤트 처리
	    $('#msg').on('input', function() {
	        $('#send').prop('disabled', $(this).val().trim() === '');
	    });

	    // 메시지 전송 버튼 클릭 이벤트 처리
	    $('#send').click(function() {
	        sendMessage();
	    });

	    // 폼 제출 이벤트 처리
	    $('#sendMessageForm').on('submit', function(e) {
	        e.preventDefault(); // 폼 제출 방지
	        sendMessage();
	    });

	    // 채팅 내용을 표시하는 함수
	    function showMessage(message) {
	        $("#communicate").append("<tr><td>" + message + "</td></tr>");
	    }

	    // 메시지 전송 함수
	    function sendMessage() {
	        var message = $('#msg').val();
	        $('#msg').val('');
	        $('#communicate').append('<tr><td>🧑💬 : ' + message + '</td></tr>');
	        stompClient.send('/app/sendMessage', {}, message);
	        $("#send").prop("disabled", true);
	    }

	    // 모달 열기/닫기 버튼 클릭 이벤트 처리
	    btnOpenModal.click(function() {
	        if (modal.is(':visible')) { 
	            modal.hide(); 
	            disconnectWebSocket(); 
	            btnOpenModal.find('i').removeClass('bi bi-x-circle').addClass('bi bi-chat-dots-fill');
	        } else { 
	            modal.show(); 
	            if (!stompClient) {
	                connectWebSocket(); 
	            }
	            btnOpenModal.find('i').removeClass('bi bi-chat-dots-fill').addClass('bi bi-x-circle');
	        }
	    });

	    // 모달 닫힐 때 연결 해제 함수
	    modal.on('hide.bs.modal', function (e) {
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
	            stompClient = null;
	        }
	    }
	});
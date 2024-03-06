<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8">
    <title>챗봇 채팅방</title>
    <!-- jQuery와 필요한 라이브러리를 포함합니다. -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
      #main-content {
        margin-top: 50px;
      }

      #connectForm,
      #sendMessageForm {
        margin-bottom: 20px;
        position: relative;
      }

      #msg {
        width: calc(100% - 70px);

        margin-right: 10px;
      }

      #send {
        width: 50px;
        height: 38px;
        font-size: 14px;
        background-color: transparent;
        border: none;
        padding: 0;
      }

      #send .bi {
        font-size: 26px;
      }

      .search-bar,
      .chat-room {
        display: flex;
        align-items: center;
      }

      .chat-room {
        margin-right: auto;
        margin-left: 0;
      }

      #connect {
        display: none;
      }
      
    </style>
  </head>

  <body>


    <div id="main-content" class="container">
      <!-- 연결 폼 -->
      <div class="row">
        <div class="col-md-12">
          <form class="form-inline" id="connectForm">
            <div class="form-group">

              <!-- 연결 해제 버튼 (초기에 비활성화) -->
              <button id="disconnect" class="btn btn-info btn-default" type="button" disabled>home</button>
            </div>
          </form>
        </div>
      </div>

      <!-- 채팅 내용 표시 테이블 -->
      <div class="row">
        <div class="col-md-12">
          <table id="conversation" class="table table-striped">
            <thead>
              <tr>
                <th>채팅창</th>
              </tr>
            </thead>
            <tbody id="communicate">
            </tbody>
          </table>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12">
          <form class="form-inline" id="connectForm">
            <div class="form-group">
              <!-- 연결 버튼 -->
              <button id="connect" class="btn btn-default" type="button"></button>
            </div>
          </form>
        </div>
      </div>

      <!-- 메시지 전송 폼 -->
      <div class="row">
        <div class="col-md-12">
          <form class="form-inline" id="sendMessageForm">
            <div class="form-group d-flex align-items-center">
              <!-- 메시지 입력 필드 -->
              <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요">
              <!-- 메시지 전송 버튼 -->
              <button id="send" class="btn" type="button">
                <i class="bi bi-arrow-up-square-fill"></i>
              </button>
            </div>
          </form>
        </div>
      </div>

    </div>


  </body>
  <!-- JavaScript code -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script>
    $(function () {
      var stompClient = null;

      // 페이지 로드 시 자동으로 시작 버튼 클릭 (소켓 연결)
      $(document).ready(function () {
        $("#connect").click();
      });

      // 소켓 연결 함수
      function connectWebSocket() {
        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
          $("#connect").prop("disabled", true);
          $("#disconnect").prop("disabled", false);
          $("#send").prop("disabled", true); // 연결 후에도 초기에 전송 버튼 비활성화
          $("#chat-room").show();
          console.log('Connected: ' + frame);
          stompClient.subscribe('/topic/public', function (message) {
            showMessage("답변 : " + message.body);
          });
        });
      }

      // 연결 버튼 클릭 이벤트 처리
      $("#connect").click(function () {
        connectWebSocket(); // 소켓 연결 함수 호출
      });

      // 연결 해제 버튼 클릭 이벤트 처리
      $("#disconnect").click(function () {
        if (stompClient !== null) {
          stompClient.disconnect();
          $("#connect").prop("disabled", false);
          $("#disconnect").prop("disabled", true);
          $("#send").prop("disabled", true);
          $("#chat-room").hide();
          console.log("Disconnected");
          location.href = "/";
        }
      });

      // 입력 필드의 입력 이벤트 처리
      $('#msg').on('input', function () {
        // 입력 필드의 값이 비어 있는지 확인
        if ($(this).val().trim() === '') {
          // 입력 값이 비어 있다면 전송 버튼을 비활성화
          $('#send').prop('disabled', true);
        } else {
          // 입력 값이 비어 있지 않다면 전송 버튼을 활성화
          $('#send').prop('disabled', false);
        }
      });

      // 메시지 전송 버튼 클릭 이벤트 처리
      $('#send').click(
        function () {
          // 메시지 전송 로직 수행
          var message = $('#msg').val();
          $('#msg').val('');
          $('#communicate').append(
            '<tr><td>보낸 메시지: ' + message + '</td></tr>');
          stompClient.send('/app/sendMessage', {}, message);
          $("#send").prop("disabled", true); // 전송 후에 전송 버튼 다시 비활성화
        });

      // 채팅 내용을 표시하는 함수
      function showMessage(message) {
        $("#communicate").append("<tr><td>" + message + "</td></tr>");
      }
    });
  </script>

  </html>
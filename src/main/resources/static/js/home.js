$(document).ready(function() {
    // 서버로부터 공지사항 리스트를 가져오는 함수
    function fetchNoticeList() {
        $.ajax({
            url: "/api/notice",
            type: "GET",
            success: function(data) {
                // 공지사항 리스트를 받아온 후 테이블에 추가
                displayNoticeList(data);
                loadView(); // 공지사항을 클릭할 때 페이지를 로드하는 함수 호출
            },
            error: function(xhr, status, error) {
                console.error("Failed to fetch notice list:", error);
            }
        });
    }

    // 공지사항 리스트를 테이블에 추가하는 함수
    function displayNoticeList(noticeList) {
        let $tbody = $('#notice-table tbody');
        $tbody.empty(); // 테이블 내용을 비움

        $.each(noticeList, function(index, notice) {
            let $tr = $('<tr class="page-click" id="' + notice.id + '">');
            $tr.append('<td><i class="bi bi-megaphone-fill text-danger">' + notice.id + '</i></td>');
            $tr.append('<td class="text-left"><div class="panel-cs-container"><p class="panel-cs-title">' + notice.title + '</p></div></td>');
            $tr.append('<td>' + notice.writer + '</td>');
            $tr.append('<td>' + notice.rdate + '</td>');

            $tbody.append($tr);
        });
    }

    // 페이지 로드 시 공지사항 리스트를 가져오고, 클릭 이벤트 핸들러를 등록
    fetchNoticeList();

    // 공지사항을 클릭할 때 페이지를 로드하는 함수
    function loadView() {
        const pageClick = $(".page-click");
        pageClick.on("click", function() {
            window.location.href = "/notice/view/" + $(this).attr("id");
        });
    }
});

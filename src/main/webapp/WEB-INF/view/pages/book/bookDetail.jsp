<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!-- Header Start -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<h3 class="display-5 text-white animated slideInDown">도서 목록</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
	<div class="book--detail--main--div">
        <div class="book--detail--content--box">
            <div class="book--detail--img--box">
                <img src="" class="book--detail--img">
            </div>
            <div class="book--detail--info--box">
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">제목</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content book--detail--content--color"></span>
                    </div>
                </div>
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">저자</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content"></span>
                    </div>
                </div>
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">발행사항</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content"></span>
                    </div>
                </div>
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">형태사항</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content">241p. : 23cm</span>
                    </div>
                </div>
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">분류기호</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content">한국십진분류법 : 808.8</span>
                    </div>
                </div>
                <div class="book--detail--info--row">
                    <div class="book--detail--info--title--box">
                        <span class="book--detail--info--title">서가번호</span>
                    </div>
                    <div class="book--detail--info--content--box">
                        <span class="book--detail--info--content">31B</span>
                    </div>
                </div>
                <div class="book--detail--row--button--box">
                    <button type="button" class="book--detail--button">대출하기</button>
                    <button type="button" class="book--detail--button">반납하기</button>
                    <button type="button" class="book--detail--button">서가위치확인</button>
                </div>
            </div>
        </div>
        <div class="book--detail--content--table--box">
            <div class="book--detail--table--title--box">
                <span class="book--detail--table--title">소장정보</span>
            </div>
            <table class="book--detail--table">
                <thead>
                    <tr>
                        <th class="book--detail--th">등록정보</th>
                        <th class="book--detail--th">자료실</th>
                        <th class="book--detail--th">반납예정일</th>
                        <th class="book--detail--th">대출상태</th>
                    </tr>
                </thead>
                <tbody class="book--detail--tbody"></tbody>
            </table>
        </div>
    </div>
    <!-- 서가위치확인 모달창 -->
    <div class="modal">
        <div class="modal--body">
           	<div class="modal--head">
           		<span>[자료위치안내]</span><br>
           		<div class="modal--botton--area">
           			<button type="button" class="modal--print--btn">프린트</button>
           			<button type="button" class="modal--closed--btn">닫기</button>
           		</div>
           	</div>
           	<span>----------------------------------------------------------------------------</span>
            <div class="modal--table--box">
            	<table class="modal--table"></table>
            </div>
           	<span>----------------------------------------------------------------------------</span>
            <div class="modal--img--box">
            	<img alt="대출장소" src="/img/book/31b.png" class="modal--img">
            </div>
        </div>
    </div>
    
    
    <!-- 서가위치확인 모달창 -->
	<script src="/js/book/bookDetail.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

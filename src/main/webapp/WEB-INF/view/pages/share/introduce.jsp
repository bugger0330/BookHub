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
    <div class="book--share--main-div">
        <div class="book--share--body">
            <div class="book--share--col-box">
                <div class="book--share--text-box">
                    <span class="book--share--title1">책꽃이에 보관하는 내 책</span>
                    <span class="book--share--title2">맡겨보세요 Keeping!</span>
                    <span class="book--share--title3">BookHub 도서관 책꽃이에 책을 키핑하면</span>
                    <span class="book--share--title3"><span class="book--share--jum">》</span>삶의 공간이 훨씬 넓어집니다.</span>
                    <span class="book--share--title3"><span class="book--share--jum">》</span>나의 책꽂이가 정리됩니다.</span>
                    <span class="book--share--title3"><span class="book--share--jum">》</span>경제적으로 도움이 됩니다.</span>
                    <div class="book--share--btn-box">
                        <button type="button" class="book--share--btn1">책 맡기기</button>
                    </div>
                </div>
                <div class="book--share--img-box">
                    <img src="/img/share/keep1.PNG">
                </div>
            </div>
            <div class="book--share--col-box">
                <div class="book--share--img-box">
                    <img src="/img/share/keep2.PNG">
                </div>
                <div class="book--share--text-box">
                    <span class="book--share--title1">더 많은 책을 더 오랜 기간동안</span>
                    <span class="book--share--title2">빌려보세요!</span>
                    <span class="book--share--title3">BookHub 도서관 책꽃이에서 책을 빌리면</span>
                    <span class="book--share--title3"><span class="book--share--jum">》</span>더 많이 더 오랬동안 읽을 수 있습니다.</span>
                    <span class="book--share--title3"><span class="book--share--jum">》</span>대여료가 존재합니다.</span>
                    <div class="book--share--btn-box">
                        <button type="button" class="book--share--btn2">책 빌리기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script>
		const btn1 = document.querySelector(".book--share--btn1");
		const btn2 = document.querySelector(".book--share--btn2");
		btn1.onclick = () => {
			window.location.href = "/share/write";
		}
		btn2.onclick = () => {
			window.location.href = "/share/read";
		}
	</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

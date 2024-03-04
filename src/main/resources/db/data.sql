-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName, password, name, gender, phone, email, type, point, zip, addr1, addr2, status, rdate)
VALUES ('user1', 'password1', 'User One', 1, '123-4567-8901', 'user1@example.com', 1, 100, '12345', 'Address 1', 'City 1', 0, CURRENT_TIMESTAMP),
       ('user2', 'password2', 'User Two', 2, '234-5678-9012', 'user2@example.com', 1, 200, '23456', 'Address 2', 'City 2', 0, CURRENT_TIMESTAMP);

-- 회원포인트 더미 데이터 삽입
INSERT INTO bh_member_point (userName, pId, point, ptDate)
VALUES ('user1', 1, 50, CURRENT_TIMESTAMP),
       ('user2', 2, 75, CURRENT_TIMESTAMP);

-- 도서 더미 데이터 삽입
INSERT INTO bh_book (bookCate1, bookCate2, bookName, descript, company, writer, borrow, img, detailImg, status, rdate)
VALUES (1, 1, 'Book One', 'Description of Book One', 'Publisher 1', 'Author 1', 0, 'img1.jpg', 'detail_img1.jpg', 'Available', CURRENT_TIMESTAMP),
       (2, 2, 'Book Two', 'Description of Book Two', 'Publisher 2', 'Author 2', 0, 'img2.jpg', 'detail_img2.jpg', 'Available', CURRENT_TIMESTAMP);

-- 도서 대출 장바구니 더미 데이터 삽입
INSERT INTO bh_product_cart (userName, bId, rdate)
VALUES ('user1', 1, CURRENT_TIMESTAMP),
       ('user2', 2, CURRENT_TIMESTAMP);

-- 도서 대출 더미 데이터 삽입
INSERT INTO bh_book_borrow (userName, brComplete, brDate, bookNo)
VALUES ('user1', 1, CURRENT_TIMESTAMP, 1),
       ('user2', 0, CURRENT_TIMESTAMP, 2);

-- 문의 더미 데이터 삽입
INSERT INTO bh_cs_qna (cate1, cate2, title, content, writer, answerComplete, rdate)
VALUES (1, 1, 'Question 1', 'Content of Question 1', 'user1', 0, CURRENT_TIMESTAMP),
       (2, 2, 'Question 2', 'Content of Question 2', 'user2', 0, CURRENT_TIMESTAMP);

-- faq 더미 데이터 삽입
INSERT INTO bh_cs_faq (cate1, cate2, title, content, rdate)
VALUES (1, 1, 'FAQ 1', 'Content of FAQ 1', CURRENT_TIMESTAMP),
       (2, 2, 'FAQ 2', 'Content of FAQ 2', CURRENT_TIMESTAMP);

-- 공지사항 더미 데이터 삽입
INSERT INTO bh_cs_notice (cate1, cate2, title, content, hit, rdate)
VALUES (1, 1, 'Notice 1', 'Content of Notice 1', 0, CURRENT_TIMESTAMP),
       (2, 2, 'Notice 2', 'Content of Notice 2', 0, CURRENT_TIMESTAMP);

-- 광고 더미 데이터 삽입
INSERT INTO bh_banner (title, content, writer, thumb1, thumb2)
VALUES ('Banner 1', 'Content of Banner 1', 'Admin', 'thumb1.jpg', 'thumb2.jpg'),
       ('Banner 2', 'Content of Banner 2', 'Admin', 'thumb3.jpg', 'thumb4.jpg');

-- 결제 더미 데이터 삽입
INSERT INTO bh_payment (userName, price, period, scProduct, ptProduct, rdate)
VALUES ('user1', 10000, 12, 1, 0, CURRENT_TIMESTAMP),
       ('user2', 20000, 6, 1, 1, CURRENT_TIMESTAMP);

-- 독서모임 더미 데이터 삽입
INSERT INTO bh_club (clubCate1, clubCate2, clubName, descript, cDate, host, headCount, hcApply, status, thumb1, thumb2, thumb3, rdate)
VALUES (1, 1, 'Club One', 'Description of Club One', '2024-02-20 10:00:00', 'Host 1', 20, 0, 'Available', 'thumb1.jpg', 'thumb2.jpg', 'thumb3.jpg', CURRENT_TIMESTAMP),
       (2, 2, 'Club Two', 'Description of Club Two', '2024-02-21 10:00:00', 'Host 2', 15, 0, 'Available', 'thumb4.jpg', 'thumb5.jpg', 'thumb6.jpg', CURRENT_TIMESTAMP);


INSERT INTO bh_cs_cate1 (c1Name) VALUES
	 ('고객서비스'),
	 ('도서'),
	 ('독서모임'),
	 ('편의시설'),
	 ('구독요금제'),
	 ('위탁도서'),
	 ('기타');


INSERT INTO bh_cs_cate2 (cate1,c2Name) VALUES
	 (10,'안내'),
	 (10,'서비스'),
	 (10,'주의'),
	 (20,'대출/반납'),
	 (20,'자료이용'),
	 (20,'도서추천/인기도서'),
	 (20,'도서관리/재교'),
	 (30,'모임일정/참여신청'),
	 (30,'독서모임주제/진행방식'),
	 (30,'회원관리');
INSERT INTO bh_cs_cate2 (cate1,c2Name) VALUES
	 (30,'이용안내/장소대여'),
	 (40,'메뉴/주문'),
	 (40,'좌석/이용안내'),
	 (40,'이벤트/할인혜택'),
	 (50,'요금제종류/혜택'),
	 (50,'구독신청/해지'),
	 (50,'요금제변경/결제'),
	 (60,'가입/등록절차'),
	 (60,'이용안내'),
	 (60,'포인트/정산');
INSERT INTO bh_cs_cate2 (cate1,c2Name) VALUES
	 (70,'칭찬/불만/제안'),
	 (70,'오류제보');

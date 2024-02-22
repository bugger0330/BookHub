-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName,password,name,gender,phone,email,`role`,`point`,zip,addr1,addr2,status,wdate,rdate) VALUES
	 ('admin','$2a$10$zM25SwQ74P0QiRvedN2zZekqKQa1K0KMdaEXs0r48yxAbEGe6N6y6','관리자',1,'010-5678-9012','admin@bookhub.com','ADMIN',2147483647,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:46:46'),
	 ('user1','$2a$10$Y.xHopea4tqZJyCj7hy9ye.Tf3ifGgsXzJ6WNUXH4dQWvyfaLZtAO','JaneSmith',1,'010-4567-8901','user1@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:51:54'),
	 ('user2','$2a$10$8vtHibzz7yG999T1NIVjO.6tVQCe4s13J5LarrvEM0OV8LYROg1eW','JaneSmith',2,'010-4567-8901','user2@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:53:09');

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

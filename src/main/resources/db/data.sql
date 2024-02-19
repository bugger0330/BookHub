-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName, password, name, gender, phone, email, type, point, zip, addr1, addr2, status, rdate)
VALUES 
    ('user1', 'password1', '김철수', 1, '123-4567-8901', 'user1@example.com', 9, 100, '12345', 'Address 1', 'City 1', 2, CURRENT_TIMESTAMP),
	('user2', 'password2', '이영희', 2, '234-5678-9012', 'user2@example.com', 1, 200, '23456', 'Address 2', 'City 2', 0, CURRENT_TIMESTAMP),
    ('user3', 'password3', '박민수', 1, '345-6789-0123', 'user3@example.com', 1, 300, '34567', 'Address 3', 'City 3', 0, CURRENT_TIMESTAMP),
    ('user4', 'password4', '정지영', 2, '456-7890-1234', 'user4@example.com', 1, 400, '45678', 'Address 4', 'City 4', 0, CURRENT_TIMESTAMP),
    ('user5', 'password5', '이지은', 1, '567-8901-2345', 'user5@example.com', 1, 500, '56789', 'Address 5', 'City 5', 0, CURRENT_TIMESTAMP),
    ('user6', 'password6', '홍길동', 2, '678-9012-3456', 'user6@example.com', 1, 600, '67890', 'Address 6', 'City 6', 0, CURRENT_TIMESTAMP),
    ('user7', 'password7', '김영수', 1, '789-0123-4567', 'user7@example.com', 1, 700, '78901', 'Address 7', 'City 7', 0, CURRENT_TIMESTAMP),
    ('user8', 'password8', '박미영', 2, '890-1234-5678', 'user8@example.com', 1, 800, '89012', 'Address 8', 'City 8', 0, CURRENT_TIMESTAMP),
    ('user9', 'password9', '최철수', 1, '901-2345-6789', 'user9@example.com', 1, 900, '90123', 'Address 9', 'City 9', 0, CURRENT_TIMESTAMP),
    ('user10', 'password10', '김미영', 2, '012-3456-7890', 'user10@example.com', 1, 1000, '01234', 'Address 10', 'City 10', 0, CURRENT_TIMESTAMP),
    ('user11', 'password11', '이민수', 1, '123-4567-8901', 'user11@example.com', 1, 1100, '12345', 'Address 11', 'City 11', 0, CURRENT_TIMESTAMP),
    ('user12', 'password12', '장영희', 2, '234-5678-9012', 'user12@example.com', 1, 1200, '23456', 'Address 12', 'City 12', 0, CURRENT_TIMESTAMP),
    ('user13', 'password13', '최철수', 1, '345-6789-0123', 'user13@example.com', 1, 1300, '34567', 'Address 13', 'City 13', 0, CURRENT_TIMESTAMP),
    ('user14', 'password14', '박미영', 2, '456-7890-1234', 'user14@example.com', 1, 1400, '45678', 'Address 14', 'City 14', 0, CURRENT_TIMESTAMP),
    ('user15', 'password15', '김철수', 1, '567-8901-2345', 'user15@example.com', 1, 1500, '56789', 'Address 15', 'City 15', 0, CURRENT_TIMESTAMP),
    ('user16', 'password16', '이영희', 2, '678-9012-3456', 'user16@example.com', 1, 1600, '67890', 'Address 16', 'City 16', 0, CURRENT_TIMESTAMP),
    ('user17', 'password17', '홍길동', 1, '789-0123-4567', 'user17@example.com', 1, 1700, '78901', 'Address 17', 'City 17', 0, CURRENT_TIMESTAMP),
    ('user18', 'password18', '정지영', 2, '890-1234-5678', 'user18@example.com', 1, 1800, '89012', 'Address 18', 'City 18', 0, CURRENT_TIMESTAMP),
    ('user19', 'password19', '김영수', 1, '901-2345-6789', 'user19@example.com', 1, 1900, '90123', 'Address 19', 'City 19', 0, CURRENT_TIMESTAMP),
    ('user20', 'password20', '이지은', 2, '012-3456-7890', 'user20@example.com', 1, 2000, '01234', 'Address 20', 'City 20', 0, CURRENT_TIMESTAMP),
    ('user21', 'password21', '최철수', 1, '123-4567-8901', 'user21@example.com', 1, 2100, '12345', 'Address 21', 'City 21', 0, CURRENT_TIMESTAMP),
    ('user22', 'password22', '장영희', 2, '234-5678-9012', 'user22@example.com', 1, 2200, '23456', 'Address 22', 'City 22', 0, CURRENT_TIMESTAMP),
    ('user23', 'password23', '김철수', 1, '345-6789-0123', 'user23@example.com', 1, 2300, '34567', 'Address 23', 'City 23', 0, CURRENT_TIMESTAMP),
    ('user24', 'password24', '이영희', 2, '456-7890-1234', 'user24@example.com', 1, 2400, '45678', 'Address 24', 'City 24', 0, CURRENT_TIMESTAMP),
    ('user25', 'password25', '홍길동', 1, '567-8901-2345', 'user25@example.com', 1, 2500, '56789', 'Address 25', 'City 25', 0, CURRENT_TIMESTAMP);



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



-- 결제 더미 데이터 삽입
INSERT INTO bh_payment (userName, price, period, scProduct, ptProduct, rdate)
VALUES ('user1', 10000, 12, 1, 0, CURRENT_TIMESTAMP),
       ('user2', 20000, 6, 1, 1, CURRENT_TIMESTAMP);

-- 독서모임 더미 데이터 삽입
INSERT INTO bh_club (clubCate1, clubCate2, clubName, descript, cDate, host, headCount, hcApply, status, thumb1, thumb2, thumb3, rdate)
VALUES (1, 1, 'Club One', 'Description of Club One', '2024-02-20 10:00:00', 'Host 1', 20, 0, 'Available', 'thumb1.jpg', 'thumb2.jpg', 'thumb3.jpg', CURRENT_TIMESTAMP),
       (2, 2, 'Club Two', 'Description of Club Two', '2024-02-21 10:00:00', 'Host 2', 15, 0, 'Available', 'thumb4.jpg', 'thumb5.jpg', 'thumb6.jpg', CURRENT_TIMESTAMP);

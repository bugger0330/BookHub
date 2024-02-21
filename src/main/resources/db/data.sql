-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName, password, name, gender, phone, email, role, point, zip, addr1, addr2, status, wdate, rdate)
VALUES
('user1', 'password1', 'John Doe', 1, '123-4567-8901', 'user1@example.com', 'USER', 100, '12345', '123 Main St', 'Apt 101', 1, NOW(), NOW()),
('user2', 'password2', 'Jane Smith', 2, '234-5678-9012', 'user2@example.com', 'USER', 50, '23456', '456 Elm St', 'Suite 202', 1, NOW(), NOW()),
('user3', 'password3', 'Michael Johnson', 1, '345-6789-0123', 'user3@example.com', 'USER', 75, '34567', '789 Oak St', NULL, 1, NOW(), NOW()),
('user4', 'password4', 'Emily Brown', 2, '456-7890-1234', 'user4@example.com', 'USER', 120, '45678', '901 Pine St', NULL, 1, NOW(), NOW()),
('user5', 'password5', 'David Wilson', 1, '567-8901-2345', 'user5@example.com', 'USER', 200, '56789', '234 Cedar St', 'Unit 303', 1, NOW(), NOW()),
('user6', 'password6', 'Sarah Taylor', 2, '678-9012-3456', 'user6@example.com', 'USER', 80, '67890', '345 Maple St', NULL, 1, NOW(), NOW()),
('user7', 'password7', 'Christopher Lee', 1, '789-0123-4567', 'user7@example.com', 'USER', 150, '78901', '456 Walnut St', NULL, 1, NOW(), NOW()),
('user8', 'password8', 'Emma Clark', 2, '890-1234-5678', 'user8@example.com', 'USER', 90, '89012', '567 Birch St', 'Apartment 404', 1, NOW(), NOW()),
('user9', 'password9', 'Daniel Hernandez', 1, '901-2345-6789', 'user9@example.com', 'USER', 180, '90123', '678 Pineapple St', NULL, 1, NOW(), NOW()),
('user10', 'password10', 'Olivia Davis', 2, '012-3456-7890', 'user10@example.com', 'USER', 300, '01234', '789 Orange St', 'Suite 505', 1, NOW(), NOW());



-- 정액권상품 
INSERT INTO bh_subscription_product (prodName, price, period) 
VALUES ('7일권', 3000, 7),
('30일권', 15000, 30),
('1년권', 35000, 365);


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

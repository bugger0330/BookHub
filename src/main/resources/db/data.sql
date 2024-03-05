
-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName, password, name, gender, phone, email, role, point, zip, addr1, addr2, status, wdate, rdate) VALUES
	 ('admin','$2a$10$zM25SwQ74P0QiRvedN2zZekqKQa1K0KMdaEXs0r48yxAbEGe6N6y6','관리자',1,'010-5678-9012','admin@bookhub.com','ADMIN',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:46:46'),
	 ('user1','$2a$10$Y.xHopea4tqZJyCj7hy9ye.Tf3ifGgsXzJ6WNUXH4dQWvyfaLZtAO','JaneSmith',1,'010-4567-8901','user1@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:51:54'),
	 ('user2','$2a$10$8vtHibzz7yG999T1NIVjO.6tVQCe4s13J5LarrvEM0OV8LYROg1eW','JaneSmith',2,'010-4567-8901','user2@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:53:09');
-- INSERT INTO bh_member (userName, password, name, gender, phone, email, role, point, zip, addr1, addr2, status, wdate, rdate)
-- VALUES
-- ('user1', 'password1', 'John Doe', 1, '123-4567-8901', 'user1@example.com', 'USER', 100, '12345', '123 Main St', 'Apt 101', 1, NOW(), NOW()),
-- ('user2', 'password2', 'Jane Smith', 2, '234-5678-9012', 'user2@example.com', 'USER', 50, '23456', '456 Elm St', 'Suite 202', 1, NOW(), NOW()),
-- ('user3', 'password3', 'Michael Johnson', 1, '345-6789-0123', 'user3@example.com', 'USER', 75, '34567', '789 Oak St', NULL, 1, NOW(), NOW()),
-- ('user4', 'password4', 'Emily Brown', 2, '456-7890-1234', 'user4@example.com', 'USER', 120, '45678', '901 Pine St', NULL, 1, NOW(), NOW()),
-- ('user5', 'password5', 'David Wilson', 1, '567-8901-2345', 'user5@example.com', 'USER', 200, '56789', '234 Cedar St', 'Unit 303', 1, NOW(), NOW()),
-- ('user6', 'password6', 'Sarah Taylor', 2, '678-9012-3456', 'user6@example.com', 'USER', 80, '67890', '345 Maple St', NULL, 1, NOW(), NOW()),
-- ('user7', 'password7', 'Christopher Lee', 1, '789-0123-4567', 'user7@example.com', 'USER', 150, '78901', '456 Walnut St', NULL, 1, NOW(), NOW()),
-- ('user8', 'password8', 'Emma Clark', 2, '890-1234-5678', 'user8@example.com', 'USER', 90, '89012', '567 Birch St', 'Apartment 404', 1, NOW(), NOW()),
-- ('user9', 'password9', 'Daniel Hernandez', 1, '901-2345-6789', 'user9@example.com', 'USER', 180, '90123', '678 Pineapple St', NULL, 1, NOW(), NOW()),
-- ('user10', 'password10', 'Olivia Davis', 2, '012-3456-7890', 'user10@example.com', 'USER', 300, '01234', '789 Orange St', 'Suite 505', 1, NOW(), NOW());




-- 회원포인트 더미 데이터 삽입
INSERT INTO bh_member_point (userName, pId, point, ptDate)
VALUES ('user1', 1, 50, CURRENT_TIMESTAMP),
       ('user2', 2, 75, CURRENT_TIMESTAMP);



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
INSERT INTO bh_cs_notice (cate1, cate2, title, content, writer, filepath, rdate) 
VALUES 
(1, 1, 'Sample Notice 1', 'Content of Sample Notice 1', 'John Doe', '/path/to/file1', '2024-03-05 10:00:00'),
(2, 2, 'Sample Notice 2', 'Content of Sample Notice 2', 'Jane Smith', '/path/to/file2', '2024-03-06 11:00:00'),
(1, 2, 'Sample Notice 3', 'Content of Sample Notice 3', 'Alice Johnson', '/path/to/file3', '2024-03-07 12:00:00');






-- 포인트샵 더미데이터
INSERT INTO bh_point_shop(prodName, point, price)
values('3000 포인트', 3000, 3500),
      ('5000 포인트', 5000, 5500),
      ('10000 포인트', 10000, 11000);

-- 출석체크 더미 데이터
insert into bh_attendance (userId, lastMonth, attendanceDays) 
	values ('admin', 3, '3, 4, 11'),
	('user1', 2, '5, 11, 13, 22, 27');
    
-- 사이드바 카테고리 데이터 mysql
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `bh_cs_cate1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bh_cs_cate1` (
  `cate1` int NOT NULL,
  `c1Name` varchar(25) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `bh_cs_cate1` WRITE;
/*!40000 ALTER TABLE `bh_cs_cate1` DISABLE KEYS */;
INSERT INTO `bh_cs_cate1` VALUES (10,'고객서비스',1),(20,'도서',2),(30,'독서모임',3),(40,'편의시설',4),(50,'포인트',5),(60,'위탁도서',6),(70,'기타',7);
/*!40000 ALTER TABLE `bh_cs_cate1` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `bh_cs_cate2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bh_cs_cate2` (
  `cate1` int NOT NULL,
  `cate2` int NOT NULL,
  `c2Name` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `bh_cs_cate2` WRITE;
/*!40000 ALTER TABLE `bh_cs_cate2` DISABLE KEYS */;
INSERT INTO `bh_cs_cate2` VALUES (10,10,'도서관 소개','/about',23),(10,11,'공지사항','/notice/list',24),(10,12,'문의하기','/qna/list',25),(10,13,'자주 묻는 질문','/faq/list',26),(20,20,'도서 목록','/book/list-all',27),(20,21,'도서 통합검색','/book/search',28),(30,30,'모임 목록','/club/index',29),(30,31,'모임 개설','/club/save',30),(30,32,'모임 개설내역','/club/saveList',31),(30,33,'모임 찜 내역','/club/wishList',32),(40,40,'카페','/point/cafe',33),(40,41,'프린트/복사','/point/print',34),(40,42,'컴퓨터 사용','/point/computer',35),(40,43,'포인트 사용내역','/point/order-list',36),(50,50,'포인트 구매하기','/point-shop',37),(50,51,'EVENT','/',38),(60,60,'위탁 도서 목록','/share/read',39),(60,61,'도서 위탁하기','/share/write',40),(70,70,'칭찬/불만/제안','/',41),(70,71,'오류제보','/',42);
/*!40000 ALTER TABLE `bh_cs_cate2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- 사이드바 카테고리 데이터 mysql
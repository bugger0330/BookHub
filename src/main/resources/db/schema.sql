
-- 테이블 드롭
DROP TABLE IF EXISTS bh_member;
DROP TABLE IF EXISTS bh_member_point;
DROP TABLE IF EXISTS bh_book;
DROP TABLE IF EXISTS bh_product_cart;
DROP TABLE IF EXISTS bh_book_borrow;
DROP TABLE IF EXISTS bh_cs_qna;
DROP TABLE IF EXISTS bh_cs_faq;
DROP TABLE IF EXISTS bh_cs_notice;
DROP TABLE IF EXISTS bh_banner;
DROP TABLE IF EXISTS bh_payment;
DROP TABLE IF EXISTS bh_club;
DROP TABLE IF EXISTS bh_point_computer;
DROP TABLE IF EXISTS bh_point_order;
DROP TABLE IF EXISTS bh_point_shop;




CREATE TABLE bh_member (
  id int NOT NULL AUTO_INCREMENT primary KEY,
  userName varchar(40) NOT NULL,
  password varchar(255) NOT NULL,
  name varchar(20) DEFAULT NULL,
  gender tinyint,
  phone char(13),
  email varchar(100) NOT NULL,
  role varchar(20) DEFAULT 'USER',
  point int DEFAULT '0',
  zip varchar(10) DEFAULT NULL,
  addr1 varchar(255) DEFAULT NULL,
  addr2 varchar(255) DEFAULT NULL,
  status int NOT NULL DEFAULT '0',
  wdate datetime DEFAULT NULL,
  rdate datetime NOT NULL
);


-- 회원포인트
CREATE TABLE bh_member_point (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20) NOT NULL,
    pId INT NOT NULL,
    point INT NOT NULL,
    ptDate DATETIME NOT NULL
);

-- 도서
CREATE TABLE `bh_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(100) NOT NULL,
  `descript` varchar(1000) NOT NULL,
  `company` varchar(100) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `borrow` int DEFAULT '0',
  `img` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT '대출가능',
  `rdate` datetime NOT NULL,
  `wdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- 도서 대출 장바구니
CREATE TABLE bh_product_cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20) NOT NULL,
    bId INT NOT NULL,
    rdate DATETIME NOT NULL
);

-- 도서 대출
CREATE TABLE `bh_book_borrow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `brComplete` tinyint NOT NULL,
  `brDate` datetime NOT NULL,
  `returnDate` datetime DEFAULT NULL,
  `bookNo` int NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `bh_point_computer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `com_number` int NOT NULL,
  `time` int DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`,`com_number`)
);

CREATE TABLE `bh_point_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `productName` varchar(45) NOT NULL,
  `productPrice` int NOT NULL,
  `productCount` int NOT NULL,
  `AllProductPrice` int NOT NULL,
  `userName` varchar(45) NOT NULL,
  `rdate` datetime NOT NULL,
  `refund_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- 문의
CREATE TABLE bh_cs_qna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cate1 INT,
    cate2 INT,
    title VARCHAR(255),
    content TEXT NOT NULL,
    file1 VARCHAR(255),
    file2 VARCHAR(255),
    file3 VARCHAR(255),
    file4 VARCHAR(255),
    writer VARCHAR(20) NOT NULL,
    answerComplete TINYINT DEFAULT 0 CHECK (answerComplete IN (0, 1, 2, 3)),
    rdate DATETIME NOT NULL
);

-- faq
CREATE TABLE bh_cs_faq (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cate1 INT NOT NULL,
    cate2 INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    rdate DATETIME NOT NULL
);

-- 공지사항
CREATE TABLE bh_cs_notice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cate1 INT NOT NULL,
    cate2 INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    hit INT DEFAULT 0,
    rdate DATETIME NOT NULL
);


-- 광고
CREATE TABLE bh_banner (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content VARCHAR(255),
    writer VARCHAR(20),
    origin_file_name VARCHAR(255) NOT NULL,
    upload_file_name VARCHAR(255) NOT NULL,
    post_yn VARCHAR(2) DEFAULT 'N',
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 결제
CREATE TABLE bh_payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20),
    price INT,
    period INT,
    scProduct INT,
    ptProduct INT,
    rdate DATETIME NOT NULL
);

-- 독서모임
CREATE TABLE bh_club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clubCate1 TINYINT NOT NULL,
    clubCate2 TINYINT NOT NULL,
    clubName VARCHAR(100) NOT NULL,
    descript VARCHAR(100) NOT NULL,
    cDate DATETIME NOT NULL,
    host VARCHAR(20) NOT NULL,
    headCount INT NOT NULL,
    hcApply INT DEFAULT 0,
    status VARCHAR(20),
    thumb1 VARCHAR(255) NOT NULL,
    thumb2 VARCHAR(255) NOT NULL,
    thumb3 VARCHAR(255) NOT NULL,
    rdate DATETIME NOT NULL,
    wdate DATETIME
);





-- 포인트 상품
CREATE TABLE bh_point_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prodName VARCHAR(100) NOT NULL,
    point INT NOT NULL,
    originFileName VARCHAR(255),
    uploadFileName VARCHAR(255),
    post_yn VARCHAR(2) DEFAULT 'Y',
    createdAt DATETIME NOT NULL
);





CREATE TABLE bh_point_shop (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prodName VARCHAR(30) NOT NULL,
    point INT NOT NULL,
    price INT NOT NULL
);


CREATE TABLE bh_user_point (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(255) NOT NULL,
    point_name VARCHAR(100) NOT NULL,
    purchase_date DATETIME NOT NULL,
    point INT NOT NULL,
    refund_yn VARCHAR(10) DEFAULT '미환불',
	imp_uid VARCHAR(255) NOT NULL,
	merchant_uid VARCHAR(255) NOT NULL
	
);


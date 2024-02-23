
-- 테이블 드롭
CREATE TABLE bh_member (
  id int NOT NULL AUTO_INCREMENT,
  userName varchar(20) NOT NULL,
  password varchar(255) NOT NULL,
  name varchar(20) DEFAULT NULL,
  gender tinyint NOT NULL,
  phone char(13) NOT NULL,
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
CREATE TABLE bh_book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bookCate1 TINYINT NOT NULL,
    bookCate2 TINYINT NOT NULL,
    bookName VARCHAR(100) NOT NULL,
    descript VARCHAR(100) NOT NULL,
    company VARCHAR(100) NOT NULL,
    writer VARCHAR(20) NOT NULL,
    borrow INT DEFAULT 0,
    img VARCHAR(255) NOT NULL,
    detailImg VARCHAR(255) NOT NULL,
    status VARCHAR(20) DEFAULT '대출가능',
    rdate DATETIME NOT NULL,
    wdate DATETIME
);

-- 도서 대출 장바구니
CREATE TABLE bh_product_cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20) NOT NULL,
    bId INT NOT NULL,
    rdate DATETIME NOT NULL
);

-- 도서 대출
CREATE TABLE bh_book_borrow (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20) NOT NULL,
    brComplete TINYINT NOT NULL,
    brDate DATETIME NOT NULL,
    returnDate DATETIME,
    bookNo INT NOT NULL
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

-- 정기권
CREATE TABLE bh_subscription_product (
    sp_id INT AUTO_INCREMENT PRIMARY KEY,
    prodName VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    period INT NOT NULL
);

-- 정기권 장바구니
CREATE TABLE bh_subscription_product_cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    sp_id INT
);

-- 포인트 상품
CREATE TABLE bh_point_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prodName VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    point INT NOT NULL,
    originFileName VARCHAR(255),
    uploadFileName VARCHAR(255),
    post_yn VARCHAR(2) DEFAULT 'Y',
    createdAt DATETIME NOT NULL
);


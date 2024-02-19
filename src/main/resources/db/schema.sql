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
-- 회원
CREATE TABLE bh_member (
  id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(20),
    gender TINYINT NOT NULL CHECK (gender IN (1, 2)),
    phone CHAR(13) NOT NULL,
    email VARCHAR(100) NOT NULL,
    type TINYINT DEFAULT 1 NOT NULL CHECK (type IN (1, 9)),
    point INT DEFAULT 0,
    zip VARCHAR(10),
    addr1 VARCHAR(255),
    addr2 VARCHAR(255),
    status INT DEFAULT 0 NOT NULL,
    wdate DATETIME,
    rdate DATETIME NOT NULL
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

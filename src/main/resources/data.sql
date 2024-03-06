
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


INSERT INTO `bh_cs_cate1` VALUES (10,'고객서비스',1),(20,'도서',2),(30,'독서모임',3),(40,'편의시설',4),(50,'포인트',5),(60,'위탁도서',6),(70,'기타',7);
INSERT INTO `bh_cs_cate2` VALUES (10,10,'도서관 소개','/about',23),(10,11,'공지사항','/notice/list',24),(10,12,'문의하기','/qna/list',25),(10,13,'자주 묻는 질문','/faq/list',26),(20,20,'도서 목록','/book/list-all',27),(20,21,'도서 통합검색','/book/search',28),(30,30,'모임 목록','/club/index',29),(30,31,'모임 개설','/club/save',30),(30,32,'모임 개설내역','/club/saveList',31),(30,33,'모임 찜 내역','/club/wishList',32),(40,40,'카페','/point/cafe',33),(40,41,'프린트/복사','/point/print',34),(40,42,'컴퓨터 사용','/point/computer',35),(40,43,'포인트 사용내역','/point/order-list',36),(50,50,'포인트 구매하기','/point-shop',37),(50,51,'EVENT','/',38),(60,60,'위탁 도서 목록','/share/read',39),(60,61,'도서 위탁하기','/share/write',40),(70,70,'칭찬/불만/제안','/',41),(70,71,'오류제보','/',42);
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
TRUNCATE TABLE bh_cs_qna;

INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(10,10,'아이디 변경 안내','최초 아이디는 필수적으로 변경 해야 합니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(10,11,'도서관 빅데이터 활용 분석 서비스','도서관 빅데이터 활용 분석 서비스','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(10,12,'예약기능사용불가','예약한 자료는 대출 순위가 된 예약자에게만 대출되며 해당이용자를 위한 대기일 동안은 예약선반에서 관리하여 다른 이용자는 이를 이용할 수 없습니다. 
\\n 따라서 이를 신청만 해놓고 이용하지 않는다면 이용하고픈 다른 이용자도 자료를 이용하지 못하게 하는 결과가 됩니다..','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(20,20,'도서관 연체 제제 기한','2월 9일~12일은 공휴일로 도서관 휴관일이므로 대출 정지일에 산입되지 않습니다.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(20,21,'자료이용','3층 자료보관실을 이용하시면 됩니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(20,22,'도서추천/인기도서','3월 인기도서는 <나는 메트로폴리탄 미술관의 경비원입니다.>','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(20,23,'도서관리/재고','매월 마지막주 토요일입니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(30,30,'모임일정/참여신청',' 북허브에서 주최하는 특정 모임은 미리 사이트에 공지를 하고 참가자를 모집할 예정입니다.\\n 
단, 일반 모임은 누구나 언제든 자유롭게 모임을 열 수 있기 때문에 딱히 언제 열려야 하거나, 언제 열릴 것이라고 말할 수 없습니다.\\n  
북허브를 자주 방문해 주세요. 내가 원하는 모임이 언제 생길지 몰라요.\\n  
만약 원하는 모임이 ‘홈’에 없다면, 직접 한번 만들어 보시는 것은 어떠세요?','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(30,31,'책을 읽지 않았는데 모임에 참여해도 될까요?','물론입니다.\\n
책을 읽고 참여하면 제일 좋겠지만, 평소에 관심만 있었던 책인데 이번 기회를 통해 이 책을 읽어보겠다 하시는 분들도 대환영입니다.\\n 
북허브는 어디까지나 독서 생태계의 부흥을 목적으로 하며 이를 위한 어떠한 방법도 환영합니다.\\n 
어려운 책을 읽거나, 책을 많이 읽은 사람을 우대하는 것이 아니라 독서 초보자들의 작은 발걸음도 이곳에서는 환영의 대상입니다.\\n 
모임에 참여한 김에 책을 읽기 시작해서 모임이 열리는 중에 완독한다면 정말 멋질 것 같습니다.\\n 
끝까지 책을 읽지 않고 모임에만 참여하는 것도 가능은 합니다만, 책을 읽고 참여하신다면 대화가 훨씬 더 풍성해질 것입니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(30,32,'회원에는 단계가 있나요?','북허브는 ‘좋아요’ 숫자나 회원 간 인기 경쟁을 피하기 위해 단계를 설정하지 않았습니다. 모두가 평등하고 평화롭게 의견을 나누는 곳이 되기를 바라는 마음에서에요.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(30,33,'이용안내/장소대여','장소대여는 도서관에서 가능합니다.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(40,40,'메뉴/주문','주문 시 입장 가능합니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(40,41,'좌석/이용안내','포인트로 결제 부탁드립니다.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(40,42,'이벤트/할인혜택','연말에 진행 예정입니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(50,50,'요금제종류/혜택','북허브 요금제','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(50,51,'구독신청/해지','결제 후 사용 가능합니다. 해지 시 잔여포인트는 사라집니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(50,52,'요금제변경/결제','포인트 결제 후 사용이 끝난 뒤 변경이 가능합니다.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(60,60,'가입/등록절차','누구나 가입할 수 있습니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(60,61,'이용안내','자세한 내용은 1:1 문의하기로 남겨주세요.','filepath','ADMIN','1',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(60,62,'포인트/정산','포인트 적립으로 정산을 대체합니다.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(70,70,'칭찬/불만/제안','1:1 문의하기로 남겨주세요.','filepath','ADMIN','0',NOW());
INSERT INTO bh_cs_qna (cate1,cate2,title,content,filepath,writer,answerComplete,rdate) VALUES
(70,71,'오류제보','1:1 문의하기로 남겨주세요.','filepath','ADMIN','1',NOW());

-- faq 더미 데이터 삽입
TRUNCATE TABLE bh_cs_faq;

INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (10,10,'도서대출회원가입 안내','도서대출회원가입 안내\\n
\\n
* 가입대상 : 누구나\\n

\\n
- 온라인 발급\\n

홈페이지 회원 가입 후 [온라인 정회원 신청]클릭 >\\n 인증 절차 후 온라인 회원증 발급\\n

실물 회원증 발급을 원하는 경우 도서관에 방문하여 발급 가능\\n

\\n
- 방문 발급\\n

홈페이지 회원 가입 후 구비서류 안내에 따라 서류를 지참하여 도서관 방문\\n
\\n
\\n
* 구비서류 : 신분증(주소확인 가능한것)\\n

               0세~초등학생의 경우 : 부모님의 신분증과 주민등록등본(발급3개월이내)을 반드시 지참\\n


* 카드발급 : 화~일(오전9시-오후10시)방문 신청 : 중앙도서관 1층 안내대(즉시 발급)\\n

* 도서대출 : 신청 당일부터 도서대출 가능\\n

* 회원증분실 : 도서관 방문 후 재발급 신청','ADMIN','2024-02-29 11:39:04');
INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
(10,11,'개인정보 변경을 하려면 어떻게 해야하나요?','개인정보는 도서관 홈페이지에서 로그인 후 회원정보수정 페이지에서 직접 변경이 가능합니다.\\n
\\n
\\n
전화문의
\\n
000)123-4597 안내대 담당
\\n
000)456-4644 제1문헌정보실 담당
\\n
000)789-4645 제2문헌정보실 담당
\\n
000)123-4646 어린이.가족열람실 담당','ADMIN','2024-02-29 11:39:04'),
	 (10,12,'비밀번호를 잊어버렸습니다. 어떻게 해야하나요?','비밀번호 재발급 안내\\n

\\n
\\n
1. 메인페이지 로그인박스 또는 로그인페이지에서 [비밀번호재발급]를 누릅니다.\\n

2. 이메일인증 선택합니다.\\n

3. 인증이 완료된 후 새로운 비밀번호 2회 입력 후 확인을 눌러서 재발급을 완료합니다.\\n

4. 새로운 비밀번호로 로그인하시면 됩니다.','ADMIN','2024-02-29 11:39:04');
INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (20,20,'도서 대출권수,기간은 어떻게 되나요? 또 연체를 하면 어떻게 되나요?','도서대출 안내\\n
\\n
\\n
* 대출시기 : 정회원 승인 후 관외대출 가능\\n

* 대출도서 : 전도서 대출(단, 참고도서, 연속간행물 제외)\\n

* 대출기간 : 1회 6권 14일간(단, 자녀가 두자녀 이상인 다자녀가족은 1회 8권, 미취학아동은 10권으로 정한다. DVD는 1회 2점 7일간 대출 가능(연장불가)\\n

* 도서반납 : 정해진 기간내에 반납하여 주시기 바라며 연체자는 성남시 중앙도서관의 운영지침에 따라 일정기간 대출을 정지하거나 연체료를 납부할 경우 대출 제재 조치를 면제해드립니다.\\n
\\n
\\n
연체 제재일수 및 연체료 산출방법\\n

- 연체도서 1권당 연체일수 가산\\n

- 연체료는 1권당 100원(1일 기준)\\n

※ 연체료 최고액은 도서정가 이내로 한정\\n


예시) 4권 3일동안 연체한 경우 -연체 제재방법 2가지 중 이용자가 선택 가능\\n

1. 연체일수 제재\\n

- 12일 간 대출정지(4권*3일)\\n

2. 연체료 납부\\n

- 연체료: 1200원(4권*300원) ※ 1일 1권당 연쳬료 100원\\n
\\n
\\n
대출기간연장 안내\\n

* 반납예정일 3일 전부터 대출도서당 7일 2회, 총 14일 연장가능\\n

* 홈페이지 login후 [대출/예약 현황조회]에서 연장가능\\n


[연장이 불가능한 경우]\\n

* 반납예정일 기준 3일이내 기간이 아닌경우 (ex)9월3일이면 1~3일 사이에만 연장가능\\n

* 성남시 도서관 대출도서 중 연체가 1권이라도 있는 경우\\n

* 예약도서, 재대출중인 도서, 비도서, 관내에서 특별한 사정으로 필요한 도서
','ADMIN','2024-02-29 11:39:04');
INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (20,21,'자료연장 기간은요?','도서 연장 시 연장 신청한 날로부터 본인의 대출기간만큼 반납예정일이 연장됩니다.\\n
\\n
\\n
대출일로부터 최대 연장 가능 기간까지 횟수에 제한 없이 연장 가능합니다.
\\n
단, 연체 중 자료나 미납 연체료가 있을 시 대출 연장 불가합니다.','ADMIN','2024-02-29 11:39:04');
INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (20,22,'도서추천 및 인기도서 목록 궁금해요','도서추천 및 인기도서 확인 \\n
 \\n
\\n
밀리의서재 : https://www.millie.co.kr/v3/today/more/best/bookstore/total

','ADMIN','2024-02-29 11:39:04');
INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (20,23,'도서관리 및 재고관리는 언제 하나요?','매월 말일입니다.','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (30,30,'새 모임을 만들고 싶어요.','‘모집 중’ 창에서 우측 상단에 있는 ‘모임 만들기’을 클릭해주세요. 모임 기간, 참여 인원 수, 참여 제한 모임 등 원하시는 모임 형태로 설정하여 내 모임을 열 수 있습니다.','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (30,31,'모임에선 어떤 이야기를 해야 할까요?','주제가 된 책이 있으니 그 책에 관한 이야기가 제일 좋겠지요. 이 책을 어떻게 읽게 되었는지부터, 읽고 난 후 감상, 독서 후에 바뀌게 된 점 등 자유로이 이야기를 나누면 됩니다. BookHub은 책 읽는 공동체를 지향하는 만큼 책을 읽는 사람들의 이야기를 중요하게 여깁니다. 책과 꼭 관련된 이야기가 아니더라도 자신의 이야기를 나누고 싶으시다면 언제든 자유롭게 나눠 주세요.','ADMIN','2024-02-29 11:39:04');
	 INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (30,32,'모임지기의 역할은 무엇인가요?','모임지기는 그 모임을 주최한 사람으로서 모임 내에서 책에 관한 자유롭고 재미난 토론이 일어날 수 있도록 도움을 주는 사람입니다. 그 책을 쓴 작가가 될 수도 있고, 그믐의 운영진일 수도 있고, 옆 집 사는 이웃일 수도 있고 책을 재미있게 읽고 누군가와 이야기를 나누고 싶은 바로 당신이 될 수도 있어요.','ADMIN','2024-02-29 11:39:04');
	 INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (30,33,'아무 모임에나 그냥 들어가도 되나요? 신청이나 승인 과정이 따로 없는지요?','BookHub의 모임은 기본적으로 모두에게 공개입니다. \\n이미 시작되었거나 한참 진행 중인 모임이라도 언제든 참여하실 수 있습니다. \\n아직 종료되지 않은 모임이라면 망설이지 마시고 책에 관한 대화에 동참하셔서 함께 이야기 나눠 보세요. 모두 반갑게 맞아줄 거예요.','ADMIN','2024-02-29 11:39:04');
	 INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (40,40,'카페 인기메뉴 알려주세요!','허쉬모카라떼(ICE가격 : 5,900원)입니다.','ADMIN','2024-02-29 11:39:04');
	 INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	 (40,41,'카페 이용안내','(주중) 08:00 ~ 18:00 \\n
		(주말) 09:00 ~ 17:00','ADMIN','2024-02-29 11:39:04');
	 INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES
	(40,42,'카페 이벤트 및 할인혜택이 있나요?','연말에 진행 될 예정입니다.','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(50,50,'요금제 종류 및 혜택 알려주세요!','Content of FAQ 1','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(50,51,'구독신청 및 해지는 어떻게 하나요?','Content of FAQ 2','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(50,52,'요금제 변경 및 결제는 어떻게 하나요?','Content of FAQ 1','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(60,60,'위탁도서 가입 및 등록절차 알려주세요.','Content of FAQ 2','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(60,61,'위탁도서 이용안내','Content of FAQ 1','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(60,62,'위탁도서 포인트 및 정산안내','Content of FAQ 2','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(70,70,'칭찬/불만/제안','1:1문의하기를 이용해주세요.','ADMIN','2024-02-29 11:39:04');
	INSERT INTO bookhub.bh_cs_faq (cate1,cate2,title,content,writer,rdate) VALUES 
	(70,71,'오류제보','1:1문의하기를 이용해주세요.','ADMIN','2024-02-29 11:39:04');




-- 공지사항 더미 데이터 삽입
TRUNCATE TABLE bh_cs_notice;

INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(10,10,'2024년 3월 BookHub도서관 휴관안내','● 전체휴관: 매월 둘째, 넷째 월요일\\n
● 자료실 휴실: 매주 월요일, 3/1(삼일절)','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(10,11,'자료관리 기능개선 패치 후속작업으로 인한 통합 웹서비스 일시중단 알림','자료관리시스템 기능개선 패치 후속 작업을 위하여 \\n

BookHub도서관 통합 웹서비스(K.LAS,  홈페이지) 서비스가 일시 중단됨을 알려드립니다.\\n
\\n
1. 중단일시 : 2023.3.24.(수) 22:00 ~ 1.25.(목) 08:00\\n

2. 중단사유 : 자료관리시스템 기능개선 패치 후속작업\\n

3. 중단대상 : BookHub도서관 통합 웹서비스(K.LAS, 홈페이지 )\\n

   * 작업상황에 따라 중단 시간은 변동 가능합니다','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(10,12,'이용자 준수사항','도서관 규정 제20조(도서관의 출입 및 이용)에 의거 도서관 이용자들은 아래와 같은 사항을 준수하여야 한다.\\n

① 도서관 자료를 무단반출, 훼손, 오손하거나 도서관 시설·물품의 훼손, 파괴, 절도행위를 금지한다.
② 도서관 이용증, 학생증, 신분증, 출입증 또는 도서관 홈페이지 접속 계정을 대여하거나, 대여받아 사용하는 행위 및 도용하는 행위를 금지한다.
③ 도서관 열람실 및 자료실 내에서는 잡담, 휴대전화 통화, 노트북 등 전자기기의 소음·타이핑 등 다른 사람의 학습에 지장을 주는 행위를 금지한다.
④ 신관 열람실 등 좌석 및 시설물은 예약, 사용한 후에 반납하여야 하며, 시설물은 입실확인을 하여야한다.
⑤ 도서관에 생수 이외의 음식물 반입 및 섭취를 금지한다. (신관 1층 카페 제외)
⑥ 도서관 및 주변 10m 시설 내에서의 흡연을 금지한다.
⑦ 도서관 컴퓨터를 학습 목적 외에 이용하는 것을 금지하며 개별 소프트웨어 무단 설치·이용 및 악성코드 배포·해킹 등 정보시스템을 공격하는 행위를 금지한다.
⑧ 도서관 내에서 음란물 검색·열람, 음란채팅, 주식 등 건전한 정보 이용을 저해하는 행위를 금지한다.
⑨ 도서관 내에서 음주, 소란, 폭력(언어폭력 포함), 불쾌감, 혐오감을 주는 행위, 근무자에게 같은 질문을 반복하는 행위 등을 금지한다.
⑩ 무단 촬영, 불필요한 신체 접촉, 음란행위, 다른 사람을 계속 응시 하는 등 성적 수치심을 유발하는 행위를 금지한다.
⑪ 도서관 출입 및 안전관리, 질서유지를 위해 모바일 이용증 제시 등 직원의 안내에 협조하여야 한다.
⑫ 도서관 내 지정된 장소 이외에 게시물을 부착하거나 허가받지 않은 게시물을 부착하는 행위를 금지한다. 이를 위반할 경우 직원은 게시물을 철거할 수 있다.
⑬ 교내 기관에서 발행한 인쇄물 또는 도서관의 허가를 받은 인쇄물 이외에는 도서관에 비치하거나 배포할 수 없다.
⑭ 기타 면학분위기를 해치는 행위, 감염병 등 안전을 위협하는 행위 등 도서관의 목적에 반하는 행위를 금지한다.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(20,20,'도서반납','반납예정일까지 반납\\n
반납한 자료의 당일 재대출은 불가\\n
대출한 자료의 반납기한을 초과한 경우, 각 권당 반납일로부터 연체일수 만큼 대출을 일시 정지','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(20,21,'자료이용','도서 자료를 이용하는 방법과 규칙에 대한 안내입니다.\\n 
도서관을 방문하시거나 온라인에서 자료를 검색하여 대출하는 방법에 대한 정보를 확인하세요.\\n
또한 도서 반납 기한 및 연체료 등에 대한 규칙도 자세히 설명되어 있습니다.\\n
자세한 내용은 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조해주세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(20,22,'도서추천/인기도서','도서추천과 현재 가장 인기 있는 도서에 대한 안내입니다. \\n
도서관 직원들이 추천하는 도서 목록과 독자들 사이에서 인기를 끌고 있는 도서에 대한 정보를 확인하세요.\\n
 매월 업데이트되는 도서추천과 인기도서 목록을 통해 다양한 주제의 책을 발견하고 대여할 수 있습니다.\\n 
또한 독자들의 리뷰와 평가도 함께 확인할 수 있어 도서 선택에 도움이 됩니다.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(20,23,'도서관리/재고','도서관의 도서 재고와 관리에 대한 안내입니다.\\n  
도서의 분류 체계, 책장 위치, 도서의 상태 등에 대한 정보를 확인할 수 있습니다.\\n 
또한 도서관에서 신규로 입고되거나 폐기되는 도서에 대한 절차와 이유도 설명되어 있습니다.\\n 
도서의 대여 및 반납에 관련된 규정과 도서 재고 관리 시스템에 대한 문의도 여기에서 확인하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(30,30,'모임일정/참여신청','도서관에서 주최하는 독서모임에 참여하는 방법과 일정에 대한 안내입니다.\\n 
독서모임 일정은 주기적으로 업데이트되며, 다양한 책을 다루는 모임에 참여할 수 있습니다.\\n 
참여를 원하는 경우, 도서관 홈페이지에서 모임 일정을 확인하고 온라인으로 참여신청을 할 수 있습니다.\\n 
참여신청 절차와 유의사항에 대한 내용을 자세히 읽어보세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(30,31,'독서모임주제/진행방식','도서관에서 개최하는 독서모임의 다양한 주제와 진행 방식에 대한 안내입니다.\\n  
독서모임은 주제별로 구성되며, 예를 들어 문학, 역사, 과학 등 다양한 분야의 책을 다루고 있습니다.\\n  
모임의 진행 방식은 토론, 발표, 퀴즈 등으로 다양하게 이루어집니다.\\n 
독서모임의 주제와 진행방식에 대한 더 자세한 정보는 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(30,32,'회원관리','독서모임에 가입하고 회원으로 참여하는 방법과 회원 정보의 수정, 탈퇴에 대한 절차를 안내하고 있습니다.\\n  
독서모임 회원에게 제공되는 혜택과 회원 간의 소통 방법에 대한 정보도 여기에서 확인할 수 있습니다.\\n  
추가로 궁금한 사항이 있으면 도서관 직원에게 문의하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(30,33,'이용안내/장소대여','도서관을 이용하는 방법과 시설 이용에 대한 안내,\\n  
그리고 도서관 내의 공간을 대여하는 방법에 대한 정보를 안내합니다.\\n 
도서관의 운영시간, 회원증 발급 절차, 자료 대출 방법 등에 대한 이용안내와 독서실, 회의실 등의 장소를 대여하는 방법에 대한 안내가 포함되어 있습니다.\\n  
더 자세한 내용은 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(40,40,'메뉴/주문','다양한 음료와 간식 메뉴를 제공하고 있으며, 주문 방법은 카운터에서 직접 주문하거나 모바일 주문 서비스를 통해 주문할 수 있습니다.\\n 
메뉴의 가격, 할인 혜택, 결제 수단에 대한 정보도 여기에서 확인하세요.\\n 
더 궁금한 사항이 있다면 카페 직원에게 문의하시기 바랍니다.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(40,41,'좌석/이용안내','특정 좌석의 예약이 가능하며, 이용 시간과 규정에 대한 정보도 확인할 수 있습니다.\\n  
추가로 좌석 예약 및 이용에 관한 궁금한 사항이 있다면 도서관 직원에게 문의하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(40,42,'이벤트/할인혜택','주기적으로 열리는 이벤트와 특별 할인 혜택에 참여하고 더 많은 혜택을 누리세요.\\n  
이벤트 참여 방법, 기간, 할인 혜택의 조건 및 혜택을 받는 방법에 대한 정보를 확인할 수 있습니다.\\n  
자세한 내용은 카페 직원이나 도서관 홈페이지에서 확인하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(50,50,'요금제종류/혜택','정회원, 학생회원, 우대회원 등 다양한 종류의 요금제를 제공하고 있으며,\\n 
각 요금제에 따른 혜택과 제약사항 등에 대한 내용이 포함되어 있습니다.\\n 
구독을 원하는 경우, 도서관 홈페이지나 직접 방문하여 신청할 수 있습니다.\\n 
자세한 내용은 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(50,51,'구독신청/해지','구독을 원하는 경우,\\n 
도서관 홈페이지에서 온라인으로 신청할 수 있으며, 현장에서도 직접 신청이 가능합니다.\\n 
또한 구독 기간이 만료되거나 해지를 원하는 경우, 도서관 홈페이지를 통해 간단한 절차로 해지할 수 있습니다.\\n 
자세한 내용은 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(50,52,'요금제변경/결제','현재 구독 중인 요금제를 변경하고 싶은 경우, 도서관 홈페이지에서 온라인으로 요금제 변경을 신청할 수 있습니다.\\n 
또한 결제 관련 정보, 결제 기간, 결제 방법 등에 대한 정보도 여기에서 확인할 수 있습니다.\\n 
추가로 궁금한 사항이 있다면 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(60,60,'가입/등록절차','도서를 위탁하고자 하는 분들은 도서관 홈페이지나 현장에서 가입 신청을 할 수 있습니다.\\n 
가입 후 도서 등록은 도서의 상태 및 정보에 대한 검토를 거쳐 이루어집니다.\\n 
등록된 도서는 도서관의 컬렉션에 추가되어 독자들에게 제공됩니다.\\n 
자세한 내용은 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(60,61,'이용안내','도서의 대출 및 반납 절차, 대출 가능 기간, 예약 방법 등에 대한 정보를 확인할 수 있습니다.\\n 
또한 위탁도서가 어떻게 선정되고 관리되는지에 대한 정보도 여기에서 확인하세요.\\n 
위탁도서 이용에 관한 궁금한 점이 있으면 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(60,62,'포인트/정산','위탁도서로 기여하시는 분들에게는 도서의 대출 횟수 등에 따라 포인트가 적립되며, 이를 정산하여 혜택을 받을 수 있습니다.\\n  
포인트 적립 및 정산에 관한 자세한 내용과 절차는 여기에서 확인하세요.\\n  
추가적인 궁금한 사항이 있으면 도서관 직원에게 문의하시거나 도서관 홈페이지를 참조하세요.','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(70,10,'칭찬/불만/제안','2조 참 잘했어요!','ADMIN','filepath',NOW());
INSERT INTO bookhub.bh_cs_notice (cate1,cate2,title,content,writer,filepath,rdate) VALUES
(70,71,'오류제보','기능 구현이 덜 된 것 같은데..','ADMIN','filepath',NOW());


-- 문의하기 답변 더미데이터
TRUNCATE TABLE bh_cs_qna_reply;

INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','1');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','2');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','3');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','4');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','5');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','6');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('위탁도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','7');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('위탁도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','8');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','9');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','10');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','11');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','12');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','13');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','14');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('위탁도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','15');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('위탁도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','16');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','17');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('자료 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','18');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','19');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('모임 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','20');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','21');
INSERT INTO bh_cs_qna_reply (content ,rdate ,writer ,qnaId) VALUES
('도서 이용에 불편을 드렸다면 시정조치 하도록 하겠습니다.',NOW(),'ADMIN','22');


-- 포인트샵 더미데이터
INSERT INTO bh_point_shop(prodName, point, price)
values('3000 포인트', 3000, 3500),
      ('5000 포인트', 5000, 5500),
      ('10000 포인트', 10000, 11000);

-- 출석체크 더미 데이터
insert into bh_attendance (userId, lastMonth, attendanceDays) 
	values ('admin', 3, '3, 4, 11'),
	('user1', 2, '5, 11, 13, 22, 27');
    
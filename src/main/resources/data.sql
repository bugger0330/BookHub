
-- 회원 더미 데이터 삽입
INSERT INTO bh_member (userName, password, name, gender, phone, email, role, point, zip, addr1, addr2, status, wdate, rdate) VALUES
	 ('admin','$2a$10$zM25SwQ74P0QiRvedN2zZekqKQa1K0KMdaEXs0r48yxAbEGe6N6y6','관리자',1,'010-5678-9012','admin@bookhub.com','ADMIN',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:46:46'),
	 ('user1','$2a$10$Y.xHopea4tqZJyCj7hy9ye.Tf3ifGgsXzJ6WNUXH4dQWvyfaLZtAO','JaneSmith',1,'010-4567-8901','user1@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:51:54'),
	 ('user2','$2a$10$8vtHibzz7yG999T1NIVjO.6tVQCe4s13J5LarrvEM0OV8LYROg1eW','JaneSmith',2,'010-4567-8901','user2@example.com','USER',0,'47353','부산광역시 부산진구','중앙대로 123',0,NULL,'2024-02-22 18:53:09');


INSERT INTO `bh_cs_cate1` VALUES (10,'고객서비스',1),(20,'도서',2),(30,'독서모임',3),(40,'편의시설',4),(50,'포인트',5),(60,'위탁도서',6),(70,'기타',7);
INSERT INTO `bh_cs_cate2` VALUES (10,10,'도서관 소개','/about',23),(10,11,'공지사항','/notice/list',24),(10,12,'문의하기','/qna/list',25),(10,13,'자주 묻는 질문','/faq/list',26),(20,20,'도서 목록','/book/list-all',27),(20,21,'도서 통합검색','/book/search',28),(30,30,'모임 목록','/club/index',29),(30,31,'모임 개설','/club/save',30),(30,32,'모임 개설내역','/club/saveList',31),(30,33,'모임 찜 내역','/club/wishList',32),(40,40,'카페','/point/cafe',33),(40,41,'프린트/복사','/point/print',34),(40,42,'컴퓨터 사용','/point/computer',35),(40,43,'포인트 사용내역','/point/order-list',36),(50,50,'포인트 구매하기','/point-shop',37),(50,51,'EVENT','/',38),(60,60,'위탁 도서 목록','/share/read',39),(60,61,'도서 위탁하기','/share/write',40),(70,70,'칭찬/불만/제안','/',41),(70,71,'오류제보','/',42);
-- 회원포인트 더미 데이터 삽입
INSERT INTO bh_member_point (userName, pId, point, ptDate)
VALUES ('user1', 1, 50, CURRENT_TIMESTAMP),
       ('user2', 2, 75, CURRENT_TIMESTAMP);

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



-- 독서모임　데이터
INSERT INTO `bh_club` (`userName`, `clubCate`, `clubName`, `descript`, `detail`, `cDate`, `host`, `headCount`, `hcApply`, `status`, `originFileName1`, `originFileName2`, `originFileName3`, `uploadFileName1`, `uploadFileName2`, `uploadFileName3`, `rdate`, `wdate`) VALUES
	('host1', 1, '함께성장-다능인', '내가 하고 싶은 일로 성취와 돈 모두 얻고 싶다면!', '멀리 가려면 함께 가야 합니다\r\n[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-16 19:00:00', '김수진 님', 20, 0, '신청가능', '57d70f32-cf1a-4145-8eb2-34b64805718d.함성 (28).png', NULL, NULL, '4aa4df70-d0a9-4c75-b8da-be3d6be25e4b_57d70f32-cf1a-4145-8eb2-34b64805718d.함성 (28).png', NULL, NULL, '2024-03-05 15:16:12', NULL),
	('host1', 1, '함께성장-시작', '나만의 뇌피셜이 아니라 뭐라도 일단 던져보는 \'시작\'', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-22 20:00:00', '김태훈 님', 20, 0, '신청가능', 'de43b495-8365-4c9b-bc60-b019e31fe421.함성.png', NULL, NULL, '2a9f9be1-7f87-4015-9f81-21f532b4b47d_de43b495-8365-4c9b-bc60-b019e31fe421.함성.png', NULL, NULL, '2024-03-05 15:18:57', NULL),
	('host1', 1, '스타트업-액션', '완벽하지 않아도 시작할 수 있습니다!', '[스타트업]은 이 사회에 풀고 싶은 문제가 있는 사람들, 기존 질서를 넘어 혁신을 이루고 싶은 꿈을 가진 사람들을 위한 클럽입니다. 예비 창업자, 스타트업 종사자, 스타트업에 관심을 갖기 시작한 분, 스타트업의 문제 해결 방식이 궁금한 분, 그 누구라도 상관없습니다.\r\n\r\n\r\n\r\n세상을 바꾼 사람들은 어떻게 기존 질서를 부수고 우리의 삶을 변화시켰을까요? 불가능한 것 같은 도전을 어떻게 현실로 만들었을까요? 그들의 이야기를 읽으며, 나만의 아이디어를 탄생시켜 봅시다. 지금에 만족하지 않고 기준을 높이고 싶은 분들, 환영합니다.', '2024-03-24 15:00:00', '최원석 님', 20, 0, '신청가능', 'b8323739-3533-4013-aa6d-c444d337c44c.스타트업 (29).png', NULL, NULL, '2582cc75-a5d9-444b-b674-81263587bbeb_b8323739-3533-4013-aa6d-c444d337c44c.스타트업 (29).png', NULL, NULL, '2024-03-05 15:20:14', NULL),
	('host1', 1, '마케팅-뷰자데', '세상에대한 호기심! no데자뷰, yes뷰자데!', '어떻게 하면 사람들의 마음을 사로잡는 제품과 서비스를 만들 수 있을까요? 어떻게 하면 사람들의 마음을 움직이는 커뮤니케이션을 할 수 있을까요? 이런 질문에 대해 고민하는 여러분을 위한 [마케팅] 클럽입니다.\r\n\r\n\r\n\r\n직업이나 직무는 상관없습니다. 내 선택이, 내 관점이 사람들의 마음을 두드릴 수 있을지 고민하고 있다면요! 그 길을 찾기 위해 골몰하고 있다면요! 우리는 마케팅과 관련된 책과 콘텐츠를 나누고 대화하며, 나만의 방법론을 구체화해 나갈 겁니다. 이런 가능성이 당신의 마음을 조금이라도 사로잡았다면, 함께 해봅시다.', '2024-04-07 10:00:00', '박세라 님', 20, 0, '신청가능', '68ef926d-a71c-4ac2-bc2c-73466a0f8fa1.마케팅 (23).png', NULL, NULL, '3dfeb2b6-db31-4ff2-99df-4857813c55cd_68ef926d-a71c-4ac2-bc2c-73466a0f8fa1.마케팅 (23).png', NULL, NULL, '2024-03-05 15:21:21', NULL),
	('host1', 1, '개발자들-심플', '코드 바깥의 세상과 사람에 관심을 가지는 개발자들', '[개발자들]은 장기적으로 좋은 개발자가 되고 싶은 모든 개발자를 위한 클럽입니다.\r\n\r\n\r\n\r\n개발‘만’ 잘 하면 어느 순간 한계에 부딪히게 될 수도 있어요. 코딩 실력이 아무리 좋아도 협업 능력, 고객 파악, 사고 대처능력, 우선순위 설정 등 너무나도 다양한 능력을 갖춰야만 하죠.\r\n\r\n\r\n\r\n멋진 개발자 파트너의 진행과 더불어 개발자 멤버들과 대화하다 보면 자연스럽게 내가 지금 필요한 것이 무엇인지 알 수 있을 거예요. 때로는 허를 찌르는 날카로운 질문들, 질문의 답을 찾기 위해 고민하는 시간을 통해 성장하는 개발자로 거듭나요!', '2024-04-04 20:00:00', '김동이 님', 20, 0, '신청가능', 'e36b9929-3d61-4d0f-8ea3-cf504254fba8.IT-디벨로퍼.png', NULL, NULL, '765487f5-5ff6-45d6-b61a-21924c8a3f79_e36b9929-3d61-4d0f-8ea3-cf504254fba8.IT-디벨로퍼.png', NULL, NULL, '2024-03-05 15:22:16', NULL),
	('host1', 1, '함께성장-동심', '무엇이든 제대로 잘 하고 싶은 사람 모여라!', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-08 19:30:00', '심소희 님', 20, 0, '신청가능', '0ef8e7ac-7388-43f5-b17e-452fac3f977d.함성 (23).png', NULL, NULL, 'f6b07b51-d7d0-4b3e-8b60-d84d443fd801_0ef8e7ac-7388-43f5-b17e-452fac3f977d.함성 (23).png', NULL, NULL, '2024-03-05 15:23:23', NULL),
	('host1', 1, '스타트업-완두콩', '다양한 인적 네트워크와 창의적인 인사이트를 모임마다 얻어 가고 싶다면', '[스타트업]은 이 사회에 풀고 싶은 문제가 있는 사람들, 기존 질서를 넘어 혁신을 이루고 싶은 꿈을 가진 사람들을 위한 클럽입니다. 예비 창업자, 스타트업 종사자, 스타트업에 관심을 갖기 시작한 분, 스타트업의 문제 해결 방식이 궁금한 분, 그 누구라도 상관없습니다.\r\n\r\n\r\n\r\n세상을 바꾼 사람들은 어떻게 기존 질서를 부수고 우리의 삶을 변화시켰을까요? 불가능한 것 같은 도전을 어떻게 현실로 만들었을까요? 그들의 이야기를 읽으며, 나만의 아이디어를 탄생시켜 봅시다. 지금에 만족하지 않고 기준을 높이고 싶은 분들, 환영합니다.', '2024-03-09 15:00:00', '오휘서 님', 30, 0, '신청가능', '647f9124-c777-4b55-964e-e4b0bc2e611a.스타트업 (33).png', NULL, NULL, '05bf31a2-01c1-4b1e-97be-2207fedcb75c_647f9124-c777-4b55-964e-e4b0bc2e611a.스타트업 (33).png', NULL, NULL, '2024-03-05 15:24:42', NULL),
	('host1', 1, '디깅더브랜드-똑똑', '그 많던 브랜드는 다 어디로 갔을까?', '[디깅더브랜드]는 브랜드를 함께 공부하고 체험하는 커뮤니티입니다. 브랜드에 관한 책을 읽고 인사이트를 나누는 것은 물론, 팝업스토어나 오프라인 공간을 다니며 온몸으로 브랜드를 느껴봅시다.\r\n\r\n\r\n\r\n호기심이 많고 새로운 아이디어에 눈이 반짝 반짝해지는 멤버들과 함께라면, 다양한 생각과 대화가 모여 브랜드에 대한 관점이 형성되는 경험을 하게 될 겁니다.', '2024-03-09 19:30:00', '강단비 님', 10, 0, '신청가능', '3ef1d55c-d856-4402-97f6-fff0739562a3.디깅더브랜드.png', NULL, NULL, 'b9615ac3-6bb9-456f-aea9-52bd5faeaa02_3ef1d55c-d856-4402-97f6-fff0739562a3.디깅더브랜드.png', NULL, NULL, '2024-03-05 15:25:35', NULL),
	('host1', 1, '함께성장-퍼스널브랜딩', '바야흐로 대 퍼스널브랜딩 시대', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-22 19:30:00', '안현섭 님', 15, 0, '신청가능', 'ee4725db-43de-4f6a-b4af-49d77299edbb.함성 (27).png', NULL, NULL, 'd7959b70-22b1-479a-a420-9c356bf97ee1_ee4725db-43de-4f6a-b4af-49d77299edbb.함성 (27).png', NULL, NULL, '2024-03-05 15:26:47', NULL),
	('host1', 1, '마케팅-오구오구', '마케터의 희로애락을 나누고 싶은 분이라면!', '어떻게 하면 사람들의 마음을 사로잡는 제품과 서비스를 만들 수 있을까요? 어떻게 하면 사람들의 마음을 움직이는 커뮤니케이션을 할 수 있을까요? 이런 질문에 대해 고민하는 여러분을 위한 [마케팅] 클럽입니다.\r\n\r\n\r\n\r\n직업이나 직무는 상관없습니다. 내 선택이, 내 관점이 사람들의 마음을 두드릴 수 있을지 고민하고 있다면요! 그 길을 찾기 위해 골몰하고 있다면요! 우리는 마케팅과 관련된 책과 콘텐츠를 나누고 대화하며, 나만의 방법론을 구체화해 나갈 겁니다. 이런 가능성이 당신의 마음을 조금이라도 사로잡았다면, 함께 해봅시다.', '2024-03-23 10:00:00', '박세희 님', 15, 0, '신청가능', '61724c0c-c6bd-4f8b-b7f2-6c1a169ce43b.마케팅 (28).png', NULL, NULL, 'e2ab0805-a51b-4e48-b562-c1a6b8217a00_61724c0c-c6bd-4f8b-b7f2-6c1a169ce43b.마케팅 (28).png', NULL, NULL, '2024-03-05 15:27:57', NULL),
	('host1', 1, '함께성장-로켓', '성장만큼 짜릿한 게 없답니다.', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-23 15:00:00', '인호준 님', 10, 0, '신청가능', 'd5e40fcf-1c5e-4f2f-a2d2-373a5f5544f0.함성 (24).png', NULL, NULL, '73990c16-aa15-4b49-b67e-a936b0da4935_d5e40fcf-1c5e-4f2f-a2d2-373a5f5544f0.함성 (24).png', NULL, NULL, '2024-03-05 15:28:48', NULL),
	('host1', 1, '함께성장-BORN AGAIN', '실질적인 인사이트를 깊이 있게 나누며 리얼 \'딥 다이브\'하실 준비되셨나요?', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-23 15:00:00', '박승표 님', 20, 0, '신청가능', 'bddee74c-4f5b-44f9-87f5-e94504c7d239.함성 (26).png', NULL, NULL, '8645d739-a244-441e-83be-54fe97c3980c_bddee74c-4f5b-44f9-87f5-e94504c7d239.함성 (26).png', NULL, NULL, '2024-03-05 15:29:59', NULL),
	('host1', 1, '함께성장-파워업', 'LET\'S POWER UP!', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-03-23 15:00:00', '유주연 님', 15, 0, '신청가능', '2f792034-97b9-47c8-9f63-8aadbd3920b2.함성 (31).png', NULL, NULL, '497581ed-73ed-4e32-808f-1bf620d6848b_2f792034-97b9-47c8-9f63-8aadbd3920b2.함성 (31).png', NULL, NULL, '2024-03-05 15:31:01', NULL),
	('host1', 1, '마케팅-푸딩', '미처 몰랐던 새로운 세상을 경험하고 싶은 마케터들 모여라!', '어떻게 하면 사람들의 마음을 사로잡는 제품과 서비스를 만들 수 있을까요? 어떻게 하면 사람들의 마음을 움직이는 커뮤니케이션을 할 수 있을까요? 이런 질문에 대해 고민하는 여러분을 위한 [마케팅] 클럽입니다.\r\n\r\n\r\n\r\n직업이나 직무는 상관없습니다. 내 선택이, 내 관점이 사람들의 마음을 두드릴 수 있을지 고민하고 있다면요! 그 길을 찾기 위해 골몰하고 있다면요! 우리는 마케팅과 관련된 책과 콘텐츠를 나누고 대화하며, 나만의 방법론을 구체화해 나갈 겁니다. 이런 가능성이 당신의 마음을 조금이라도 사로잡았다면, 함께 해봅시다.', '2024-03-23 19:30:00', '김민주 님', 20, 0, '신청가능', '687415dd-9dbe-4c7a-bb83-8b09401f4619.마케팅 (26).png', NULL, NULL, 'c3920571-6024-4f76-9c2c-723f85a3e7df_687415dd-9dbe-4c7a-bb83-8b09401f4619.마케팅 (26).png', NULL, NULL, '2024-03-05 15:31:53', NULL),
	('host1', 1, '디깅더브랜드-봄', '일상에서 익숙한 브랜드들, 새롭게 바라봄!', '[디깅더브랜드]는 브랜드를 함께 공부하고 체험하는 커뮤니티입니다. 브랜드에 관한 책을 읽고 인사이트를 나누는 것은 물론, 팝업스토어나 오프라인 공간을 다니며 온몸으로 브랜드를 느껴봅시다.\r\n\r\n\r\n\r\n호기심이 많고 새로운 아이디어에 눈이 반짝 반짝해지는 멤버들과 함께라면, 다양한 생각과 대화가 모여 브랜드에 대한 관점이 형성되는 경험을 하게 될 겁니다.', '2024-03-24 15:00:00', '김성훈 님', 20, 0, '신청가능', '7f0c45ec-dc10-419f-baa8-46b7290cfb84.디깅더브랜드.png', NULL, NULL, 'd84e4d14-4e56-47ab-ba6b-d91766302ed4_7f0c45ec-dc10-419f-baa8-46b7290cfb84.디깅더브랜드.png', NULL, NULL, '2024-03-05 15:32:44', NULL),
	('host1', 1, '함께성장-빼기', '삶을 단순하고 명료하게 만드는 힘', '[함께성장]은 지속적인 성장을 통해, 더 나은 내가 되고 싶은 사람들을 위한 클럽입니다. 일을 더 잘 하는 법은 무엇일까? 내가 추구하는 일과 삶의 조화란 어떤 것일까? 좋은 리더와 동료는 어떤 사람이고 어떻게 되는 것일까?\r\n\r\n\r\n\r\n혼자서는 힘들다 느낀 것도, 함께라면 좀 더 즐기면서 이룰 수 있습니다. 비슷한 목표를 가진 사람들과 함께한 1년 뒤의 모습은 분명히 다를 겁니다. 인생의 상승곡선을 그리고 싶은 사람들과 ‘함께 성장’해봅시다.', '2024-04-06 10:00:00', '도명 님', 15, 0, '신청가능', '50152864-6a26-4c5d-969e-ec3ca01a98cc.함성 (30).png', NULL, NULL, '39730e78-bf54-48e4-ae3b-665580861e95_50152864-6a26-4c5d-969e-ec3ca01a98cc.함성 (30).png', NULL, NULL, '2024-03-05 15:34:03', NULL),
	('host1', 2, '문-레드', '진솔한 토론, 재미난 뒤풀이, 다양한 번개를 추구하는 문학 모임', '사람을 사람답게, 문학을 읽는 이유 아닐까요?\r\n문학은 무관심했던 주제에 흥미를 갖게 합니다. 미워했던 사람을 용서하게 합니다. 상상해본 적 없는 삶을 기대하게 합니다. 노벨문학상 수상 작가 압둘자라크 구르나는 “사람을 사람답게 만드는 게 문학”이라고 했죠.\r\n\r\n\r\n\r\n우리는 소설, 수필, 시, 희곡을 함께 읽습니다. 악당, 히어로, 어린이, 외계인, 장애인, 사이보그를 만나봅시다. 23세기 서울, 고대 그리스의 아테네, 90년대 홍콩을 누벼봅시다. 그 안에서 나를, 우리를, 타인을, 세상을 마주해 봅시다.', '2024-04-06 15:00:00', '김종열 님', 15, 0, '신청가능', 'ba48d6b1-52fc-438b-b30d-9ca3f9403b98.문.png', NULL, NULL, 'a901bf4d-2a2e-4923-a4b3-88f600c3b6c3_ba48d6b1-52fc-438b-b30d-9ca3f9403b98.문.png', NULL, NULL, '2024-03-05 15:37:49', NULL),
	('host1', 2, '문-블랙', '17년부터 지속된 문학 모임, 사람과 술을 사랑한다면 여기로!', '문학은 무관심했던 주제에 흥미를 갖게 합니다. 미워했던 사람을 용서하게 합니다. 상상해본 적 없는 삶을 기대하게 합니다. 노벨문학상 수상 작가 압둘자라크 구르나는 “사람을 사람답게 만드는 게 문학”이라고 했죠.\r\n\r\n\r\n\r\n우리는 소설, 수필, 시, 희곡을 함께 읽습니다. 악당, 히어로, 어린이, 외계인, 장애인, 사이보그를 만나봅시다. 23세기 서울, 고대 그리스의 아테네, 90년대 홍콩을 누벼봅시다. 그 안에서 나를, 우리를, 타인을, 세상을 마주해 봅시다.', '2024-03-13 20:00:00', '차주현 님', 20, 0, '신청가능', 'e03d4984-543a-4fe5-ad32-36b99f87def5.문 (28).png', NULL, NULL, '9f7ccb3e-bbe3-4059-94cf-857b8bc0675f_e03d4984-543a-4fe5-ad32-36b99f87def5.문 (28).png', NULL, NULL, '2024-03-05 15:39:03', NULL),
	('host1', 2, '문-열린', '한 달에 한 번은 낭만적일 필요가 있어요!', '문학은 무관심했던 주제에 흥미를 갖게 합니다. 미워했던 사람을 용서하게 합니다. 상상해본 적 없는 삶을 기대하게 합니다. 노벨문학상 수상 작가 압둘자라크 구르나는 “사람을 사람답게 만드는 게 문학”이라고 했죠.\r\n\r\n\r\n\r\n우리는 소설, 수필, 시, 희곡을 함께 읽습니다. 악당, 히어로, 어린이, 외계인, 장애인, 사이보그를 만나봅시다. 23세기 서울, 고대 그리스의 아테네, 90년대 홍콩을 누벼봅시다. 그 안에서 나를, 우리를, 타인을, 세상을 마주해 봅시다.', '2024-03-15 20:00:00', '김소영 님', 20, 0, '신청가능', '93c2ed8a-2697-4c50-81f3-4769da34775f.문 (30).png', NULL, NULL, '4aaeefc7-a94e-422e-ba43-de3bf1cdaf9a_93c2ed8a-2697-4c50-81f3-4769da34775f.문 (30).png', NULL, NULL, '2024-03-05 15:40:16', NULL),
	('host1', 2, '문-함께봄', '"함께봄"에서는 누구든지 매달 책을 읽을 수 있어요!', '사람을 사람답게, 문학을 읽는 이유 아닐까요?\r\n문학은 무관심했던 주제에 흥미를 갖게 합니다. 미워했던 사람을 용서하게 합니다. 상상해본 적 없는 삶을 기대하게 합니다. 노벨문학상 수상 작가 압둘자라크 구르나는 “사람을 사람답게 만드는 게 문학”이라고 했죠.\r\n\r\n\r\n\r\n우리는 소설, 수필, 시, 희곡을 함께 읽습니다. 악당, 히어로, 어린이, 외계인, 장애인, 사이보그를 만나봅시다. 23세기 서울, 고대 그리스의 아테네, 90년대 홍콩을 누벼봅시다. 그 안에서 나를, 우리를, 타인을, 세상을 마주해 봅시다.', '2024-04-06 15:00:00', '류은진 님', 20, 0, '신청가능', 'a92d0d43-bc39-4c46-8c19-68b104063348.문 (29).png', NULL, NULL, '52f715e1-7c43-4c6c-8091-4470af165c8a_a92d0d43-bc39-4c46-8c19-68b104063348.문 (29).png', NULL, NULL, '2024-03-05 15:41:13', NULL),
	('host1', 3, '파운더의 사고방식-프런티어', '누구보다 치열하게 대화 나누며 나만의 새로운 길을 그려봅시다', '우리 시대를 살아가기 위한 사고방식, 창업가의 사고방식\r\n자본주의 사회에서 삶의 주도권을 잡기 위해, 창업가의 태도와 역량이 필요하다고 믿는 사람들이 모인 클럽입니다. 창업가야 말로 자본주의의 가장 앞단에서 주도적인 삶을 개척하는 사람이니까요.\r\n\r\n\r\n\r\n우리는 이곳에서 일과 삶의 원칙을 세워나가고, 돈과 시간에 대한 관점을 뒤집어보고, 인간에 대한 이해도를 높여나가며, 창업가들의 태도와 역량을 훔쳐 갈 겁니다. \r\n\r\n\r\n\r\n스스로가 창업가라고 생각하며 삶을 살아봅시다. 창업을 하든 하지 않든 창업가들의 머릿속을 훔쳐보고 그들의 성공 방정식을 해킹해 봅시다. 자유와 주도적인 삶을 향한 여정을 함께 할 동료들을 만나봅시다. ', '2024-03-17 15:00:00', '안성진 님', 20, 0, '신청가능', '6fb29124-1155-43a3-8269-004a932db0ed.파운더 (2).png', NULL, NULL, 'c1bbc920-8554-491f-8c44-555c3e2d11c5_6fb29124-1155-43a3-8269-004a932db0ed.파운더 (2).png', NULL, NULL, '2024-03-05 16:11:39', NULL),
	('host1', 3, '파운더의 사고방식-창업시작', '회사 생활만으로는 원하는 자유를 얻을 수 없다 생각한다면!', '우리 시대를 살아가기 위한 사고방식, 창업가의 사고방식\r\n자본주의 사회에서 삶의 주도권을 잡기 위해, 창업가의 태도와 역량이 필요하다고 믿는 사람들이 모인 클럽입니다. 창업가야 말로 자본주의의 가장 앞단에서 주도적인 삶을 개척하는 사람이니까요.\r\n\r\n\r\n\r\n우리는 이곳에서 일과 삶의 원칙을 세워나가고, 돈과 시간에 대한 관점을 뒤집어보고, 인간에 대한 이해도를 높여나가며, 창업가들의 태도와 역량을 훔쳐 갈 겁니다. \r\n\r\n\r\n\r\n스스로가 창업가라고 생각하며 삶을 살아봅시다. 창업을 하든 하지 않든 창업가들의 머릿속을 훔쳐보고 그들의 성공 방정식을 해킹해 봅시다. 자유와 주도적인 삶을 향한 여정을 함께 할 동료들을 만나봅시다. ', '2024-03-21 19:30:00', '김녕훈 님', 15, 0, '신청가능', '0cbade5c-4a2f-4363-83ad-757385ed2ea7.png', NULL, NULL, 'b0b21ce9-0439-4bf8-a1f3-ed832f031872_0cbade5c-4a2f-4363-83ad-757385ed2ea7.png', NULL, NULL, '2024-03-05 16:12:30', NULL),
	('host1', 4, '북씨-설렘', '정말 재미있는 작품을 만났을 때 감동과 설렘을 다시 느끼고 싶다면?', '책과 영화를 페어링할 때 일어나는 마법\r\n“이 책을 이 영화랑 본다고?” 책과 영화를 더 깊이 즐기는 클럽 [북씨]입니다. 두 작품이 공유하는 주제를 놓고 대화하다 보면, 작품 속에서 무심코 지나친 부분을 새롭게 느낄 수 있습니다.\r\n\r\n\r\n\r\n또 영화와 책의 취향을 공유할 수 있는 친구를 만드는 클럽입니다. 대화를 나눌 작품이 1+1인 만큼, 나눌 수 있는 대화의 갈래는 열 배, 백 배일 겁니다. 이곳에 오면 영화와 책을 사랑하게 될 거예요. 진심으로요!\r\n\r\n\r\n\r\n✔️ [북씨] 클럽은 매 모임 선정된 영화와 책을 바탕으로 대화를 나눕니다. 모임 참석 전, 책과 영화를 모두 보고 와주세요.', '2024-04-07 15:00:00', '전범준 님', 15, 0, '신청가능', '747ba02c-70bf-4bd1-874c-a37aa8dd3482.북씨 (96).png', NULL, NULL, 'eff1786b-a500-494e-8d77-3bd96412f69c_747ba02c-70bf-4bd1-874c-a37aa8dd3482.북씨 (96).png', NULL, NULL, '2024-03-05 16:15:35', NULL),
	('host1', 4, '북씨-스푸키', '신규 멤버가 연장 멤버가 되는 클럽! 무서운 이야기를 나눠요!', '“이 책을 이 영화랑 본다고?” 책과 영화를 더 깊이 즐기는 클럽 [북씨]입니다. 두 작품이 공유하는 주제를 놓고 대화하다 보면, 작품 속에서 무심코 지나친 부분을 새롭게 느낄 수 있습니다.\r\n\r\n\r\n\r\n또 영화와 책의 취향을 공유할 수 있는 친구를 만드는 클럽입니다. 대화를 나눌 작품이 1+1인 만큼, 나눌 수 있는 대화의 갈래는 열 배, 백 배일 겁니다. 이곳에 오면 영화와 책을 사랑하게 될 거예요. 진심으로요!\r\n\r\n\r\n\r\n✔️ [북씨] 클럽은 매 모임 선정된 영화와 책을 바탕으로 대화를 나눕니다. 모임 참석 전, 책과 영화를 모두 보고 와주세요.', '2024-03-09 15:00:00', '조민국 님', 15, 0, '신청가능', 'b086248f-2585-4abe-a040-06fb0f7c6877.북씨 (98).png', NULL, NULL, 'a1f73590-6bbf-4b16-9374-6bff909fdd8c_b086248f-2585-4abe-a040-06fb0f7c6877.북씨 (98).png', NULL, NULL, '2024-03-05 16:17:02', NULL),
	('host1', 4, '천일영화', '영화 저널리스트, 대중문화 칼럼니스트 민용준 님', '올해로 6년차를 맞이한 [천일영화] 클럽은 영화 원작 도서와 해당 영화를 감상한 멤버들과 모여, 영화로 가능한 대화를 제시하고 삶과 낙에 관한 다양한 시각과 관점을 공유하는 모임이었습니다. 하지만 지난 시즌부터는 영화 원작이라는 기준에서 벗어난 도서와 영화를 연결해 각기 다른 두 창작적 결과를 충돌시키거나 융합하며 보다 너르고 색다른 사유와 견해로 팽창하고 확장할 수 있는 대화의 가능성을 제공하고자 했습니다.\r\n\r\n\r\n\r\n이번 시즌의 [천일영화] 역시 그러한 가능성을 느낄 수 있는 자리를 마련하고자 합니다. [천일영화]는 클럽장을 맡고 있는 민용준 기자의 발제문을 토대로 멤버들끼리 서로 생각을 교류하고 공감의 폭을 넓혀나가는 과정과 함께 선정된 작품에 관한 클럽장의 해설을 듣는 시간도 충실하게 제공됩니다. 클럽장이 직접 선정한 영화와 도서에 대한 감상을 보다 너르고 깊게 강화하고 확대할 수 있는 낙을 제공하고자 해당 도서와 영화를 둘러싼 지식과 해설을 망라하게 전합니다.', '2024-03-30 15:00:00', '민용준 님', 30, 0, '신청가능', 'a758bada-5574-4d6a-a2a6-5d809c4780fd.png', NULL, NULL, '755544cf-c569-421e-88cc-ccc13458d430_a758bada-5574-4d6a-a2a6-5d809c4780fd.png', NULL, NULL, '2024-03-05 16:18:41', NULL),
	('host1', 5, '과학의 창으로 보는 세상의 언어', '44만 유튜브 채널 \'과학쿠키\' 운영자 이효종 님', '덮어놓고 어렵다고만 생각했던 과학, 쉽고 재미있게!\r\n얼음은 왜 녹을까요? 인간의 폐와 나무는 왜 닮았을까요? 우리가 당연하게 생각하는 모습이지만, 이 현상들을 호기심을 가지고 바라보는 것이 쉽지 않을 때가 있습니다.\r\n\r\n\r\n\r\n[과학을 쿠키처럼!]에서는 정답이 아닌, 수많은 \'나\'가 모인 세상을 이해하는 \'도구\' 중 하나로 과학을 써먹어 볼 겁니다. 44만 유튜브 채널 \'과학쿠키\' 운영자 클럽장 이효종 님과 함께 우리 주변 현상들을 과학적 사고로 설명하는 책들 읽으면서요. \r\n\r\n\r\n\r\n과학의 정수라고 할 수 있는 우주와 생명에 대해 통찰을 담은 책, 『인포메이션』과 『생명의 수학』을 읽는 것만으로 나와 우리를 이해하는 데 큰 도움이 될 거라 생각합니다. 과학을 일부러 재밌게 배우지 않아도, 그 자체만으로 충분히 재미있고 아름답다는 것도 알게 될 거예요. \r\n\r\n\r\n\r\n"책에 담긴 수많은 정보들을 혼자 소화하기엔 조금 버거울 수 있습니다. 그래서 함께 읽어보고 싶어요. 평소엔 쓰지 않던 뇌를 써볼 수 있는 기회, 신선한 충격을 받는 시간이 될 수 있을 겁니다. 과학이라는 호기심을 통해 세상을 바라보고 싶으신 지적 호기심에 목마른 분들 모두 환영해요!"', '2024-03-24 15:00:00', '이효종 님', 30, 0, '신청가능', 'ec423532-ae3a-4a6b-bc40-5d234e70133b.이효종 님.jpeg.png', NULL, NULL, 'e028bf7a-f378-4e70-8a78-d0e8222a2052_ec423532-ae3a-4a6b-bc40-5d234e70133b.이효종 님.jpeg.png', NULL, NULL, '2024-03-05 16:22:32', NULL),
	('host1', 3, '파운더의 사고방식-자유', '돈 벌어서 어떻게 쓰고 계십니까?', '우리 시대를 살아가기 위한 사고방식, 창업가의 사고방식\r\n자본주의 사회에서 삶의 주도권을 잡기 위해, 창업가의 태도와 역량이 필요하다고 믿는 사람들이 모인 클럽입니다. 창업가야 말로 자본주의의 가장 앞단에서 주도적인 삶을 개척하는 사람이니까요.\r\n\r\n\r\n\r\n우리는 이곳에서 일과 삶의 원칙을 세워나가고, 돈과 시간에 대한 관점을 뒤집어보고, 인간에 대한 이해도를 높여나가며, 창업가들의 태도와 역량을 훔쳐 갈 겁니다. \r\n\r\n\r\n\r\n스스로가 창업가라고 생각하며 삶을 살아봅시다. 창업을 하든 하지 않든 창업가들의 머릿속을 훔쳐보고 그들의 성공 방정식을 해킹해 봅시다. 자유와 주도적인 삶을 향한 여정을 함께 할 동료들을 만나봅시다. ', '2024-04-06 15:00:00', '우승배 님', 15, 0, '신청가능', 'd7cc04da-bf52-40bf-88ef-436440111326.파운더 (2).png', NULL, NULL, '8281612a-a61e-486e-8175-65ae398666cd_d7cc04da-bf52-40bf-88ef-436440111326.파운더 (2).png', NULL, NULL, '2024-03-05 16:32:37', NULL),
	('host1', 6, '잉잉-투게더', 'Miss conversing in English?', '영어로 읽어야 더 좋은 책이 있습니다.\r\n우리 사회에서는 영어는 곧 시험점수로 환산되기 마련이죠. 그러나 우리는 알고 있습니다. 시험지 속 영어 지문이 영어의 전부가 아니라는 것도, 출제자가 아닌 작가의 어조와 뉘앙스를 느낄 수 있는 게 영어 원서의 매력이라는 것도 말이죠.\r\n\r\n\r\n\r\n막상 영어 원서를 읽고, 책을 읽자니 함께할 사람을 찾는 게 쉽지 않습니다. 그래서 트레바리는 [잉잉]을 만들었습니다. 영어에 관심과 의욕이 있는 사람들이 모여 지적인 대화를 나누고, 함께 친해질 수 있도록요.\r\n\r\n\r\n\r\n사실은 그냥 한국어보다 영어가 편해서 [잉잉]을 선택하실 수도 있죠. 뭐 어때요. 어떤 이유에서든 우리는 영어로 된 책을 함께 읽고, 영어로 독후감을 쓰고, 영어로 대화를 나눕니다. 우리가, 함께!', '2024-04-03 20:00:00', '구세권 님', 20, 0, '신청가능', '8f70cb21-7b49-484a-bad7-91cae543e1bf.png', NULL, NULL, 'a856843c-08c3-4e11-986b-4e17cea578c6_8f70cb21-7b49-484a-bad7-91cae543e1bf.png', NULL, NULL, '2024-03-05 16:36:03', NULL),
	('host1', 6, '무경계-무탈', '평생의 인연을 얻을 수 있는 클럽! 평안함을 위한 여정에 함께 해보세요.', '독서모임의 진수 [무경계]에 오신 것을 환영합니다\r\n[무경계]는 이름 그대로 경계가 없는 클럽입니다. 그래서 모임의 주제도, 함께 읽을 책도 정해져 있지 않죠. 주제와 장르를 불문하고 어떤 책이든 편견 없이 읽고 대화하기 위해 모든 것은 추천과 투표로 결정합니다.\r\n\r\n\r\n\r\n우리는 혼자라면 읽지 않았을 책을 함께 정하고, 읽습니다. 다양한 사람들과 대화하며 서로의 취향을 나누고, 그 과정에서 혼자라면 하지 않았을, 못했을 생각과 경험을 마주할 거예요.', '2024-04-06 15:00:00', '박영선 님', 15, 9, '신청가능', 'fee50bf0-97bf-4688-8bb1-feb4991aac6d.무경계 (25).png', NULL, NULL, 'f31a55bd-910f-4bfc-9525-2ecb351057ef_fee50bf0-97bf-4688-8bb1-feb4991aac6d.무경계 (25).png', NULL, NULL, '2024-03-05 16:36:55', NULL),
	('host1', 6, '체험독서-시선', '진실, 선택, 취향과 남겨짐…익숙한 주제를 색다른 시선으로 보기!', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-04-13 10:00:00', '김동현 님', 15, 9, '신청가능', 'b3e7aadd-c7e6-4446-a1ec-79ef7709e213.체험독서 (69).png', NULL, NULL, 'c4732cea-a649-49bc-83bd-dd6872d77b8c_b3e7aadd-c7e6-4446-a1ec-79ef7709e213.체험독서 (69).png', NULL, NULL, '2024-03-05 16:37:58', NULL),
	('host1', 6, '체험독서-예술', '당신이 예술에 행복해하는 사람이라면, 여기서 만나요.', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-03-08 20:00:00', '김문 님', 20, 14, '신청가능', 'b9f52b91-769e-40c0-8b4a-ffc8de99636f.체험독서 (67).png', NULL, NULL, 'f1e90bec-52e1-49e2-9866-7f256c4d3838_b9f52b91-769e-40c0-8b4a-ffc8de99636f.체험독서 (67).png', NULL, NULL, '2024-03-05 16:39:12', NULL),
	('host1', 6, '체험독서-쑥쑥', '파트너만 17번째! 트레바리가 일상이 된 파트너와 트레바리 시작하기', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-03-17 15:00:00', '배진호 님', 15, 9, '신청가능', '39ded120-afe4-4562-925a-aa52a0608bd4.체험독서 (66).png', NULL, NULL, 'f733dfa7-38bd-47d6-8b1a-3a62d44524bc_39ded120-afe4-4562-925a-aa52a0608bd4.체험독서 (66).png', NULL, NULL, '2024-03-05 16:40:23', NULL),
	('host1', 6, '찰칵', '기억은 짧고, 기록은 길다. 1일 1기록 같이 하실래요?', '지금 이 순간을, 찰칵\r\n“삶은 흘러가는 것이라 사진을 찍는 순간 사라지기 때문에 똑같은 장면을 다시 찍는다는 것은 불가능하다. 인생은 한 번뿐이다. 영원히.” - 앙리 카르티에 브레송\r\n\r\n\r\n\r\n“렌즈는 ‘바깥’을 향해 있더라도 사진은 자신의 ‘안’에서 생성되는 시선의 매개체다.” - 책 『당신 곁에 있습니다』에서 발췌\r\n\r\n\r\n\r\n[찰칵]은 책과 사진으로 생각과 시선을 나누는 클럽입니다. 인생에서 한 번뿐인 지금 이 순간을 조금 더 소중하게 기억하는 방법을 나눕니다.\r\n\r\n\r\n\r\n프레임 속 피사체, 찍는 순간의 감정 등 다양한 주제로 얘기해봐요. 스스로에 대해 더 알아가는 시간이 될 거예요.\r\n\r\n\r\n\r\n우리의 대화를 기억하며 셔터를 눌러봐요. 결국 남는 건 사진뿐이니까요.\r\n\r\n\r\n\r\n﻿📝 1일 1기록\r\n\r\n이번 시즌은 매일 기록을 남길 거에요. 인스타든, 블로그든, 다이어리든, 어디든 상관없습니다. 자신에 대해 더 알게 되는 시간이 될 거예요.', '2024-03-21 20:00:00', '이형석 님', 20, 14, '신청가능', 'e9e9d440-0d92-4a1f-a6f8-8245971cd1b2.찰칵.png', NULL, NULL, 'ea1c901e-10e6-4fdd-b4c6-d08979f9e5bb_e9e9d440-0d92-4a1f-a6f8-8245971cd1b2.찰칵.png', NULL, NULL, '2024-03-05 16:41:34', NULL),
	('host1', 6, '체험독서-산', '산에 진심인 파트너와 함께하는 에너제틱 클럽!', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-03-22 07:30:00', '김연주 님', 15, 9, '신청가능', 'f77a3733-9816-49cc-ad89-82e5b8e95263.체험독서 (65).png', NULL, NULL, '66675514-167d-40db-9550-10ba0d9998ce_f77a3733-9816-49cc-ad89-82e5b8e95263.체험독서 (65).png', NULL, NULL, '2024-03-05 16:42:35', NULL),
	('host1', 6, '체험독서-지금여기', '지금, 여기 이 순간의 나를 만나보아요!', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-03-22 20:00:00', '김유경 님', 20, 14, '신청가능', 'a0d17336-b1c5-4d33-b2e7-dc7f77ead333.체험독서 (58).png', NULL, NULL, '5ada9ff6-71bb-4687-82bf-f32f852d85ed_a0d17336-b1c5-4d33-b2e7-dc7f77ead333.체험독서 (58).png', NULL, NULL, '2024-03-05 16:43:30', NULL),
	('host1', 1, '체험독서-글로우', '반짝반짝, 새로운 취향을 함께 탐험해요!', '까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!', '2024-03-24 15:00:00', '구예진 님', 20, 14, '신청가능', 'a27b1e65-7d45-459c-9c1f-ccaf1fc3c8a9.체험독서 (2).png', NULL, NULL, '9b630b5c-f44f-4009-9f50-ec581141f5a2_a27b1e65-7d45-459c-9c1f-ccaf1fc3c8a9.체험독서 (2).png', NULL, NULL, '2024-03-05 16:45:03', NULL),
	('host1', 6, '체험독서-일탈', '우리의 첫 번째 일탈은 산으로 떠납니다! 벌써 4번째 시즌을 맞이한 클럽.', '할까, 말까 고민될 때 “남는 건 경험!”이라 외치는 당신에게\r\n새로운 경험은 나 자신을 더 잘 알게 해주고, 취향의 폭을 넓혀주며, 세상에 대한 이해도를 높여줍니다. 우리는 책을 읽고, 책 내용을 직접 경험할 겁니다. 미술책을 읽고 화가가 된 듯 그림을 그려 봅시다. 소설을 읽고 두 주인공이 이별을 맞이한 장소에 직접 가봅시다.\r\n\r\n\r\n\r\n책과 커뮤니티의 힘을 빌린다면, 무궁무진한 경험의 세계가 펼쳐질 거예요. 내가 이 경험을 좋아할지 아닐지는, 경험해 봐야 알겠죠!\r\n\r\n', '2024-03-27 19:30:00', '허수영 님', 15, 9, '신청가능', 'e525dc53-fcc3-4d57-8e37-a9b373f3ae16.체험독서 (63).png', NULL, NULL, '20d76dcb-f758-47e1-8379-08c6f2a9a588_e525dc53-fcc3-4d57-8e37-a9b373f3ae16.체험독서 (63).png', NULL, NULL, '2024-03-05 16:46:09', NULL),
	('host1', 6, '미식독서', '즐겁게 읽고 맛있게 먹자!', '생의 모든 것은 다 먹고살자고 하는 일!\r\n먹는 것에 진심이라면 [미식독서]에서 먹고, 읽고, 이야기 나눠요. 우리는 소설 속 음식에 대해 이야기 나누기도 하고, 먹는 것을 좋아하는 사람의 심리를 파헤쳐 보기도 하고, 계속해서 먹으려면 어떻게 돈을 벌어야 할지 고민해 보기도 할 거예요.\r\n\r\n\r\n\r\n‘봄’하면 꽃보다 도다리가 먼저 생각나는 사람이라면, ‘여름’에 마시는 시원한 생맥주 한 잔의 기쁨을 알고 있는 사람이라면, 천고마비의 계절 ‘가을’엔 말처럼 살찐다면, ‘겨울’ 냄새가 나면 가슴속에 2000원을 품고 다니는 사람이라면!\r\n\r\n\r\n\r\n먹는 이야기로 시작하지만 먹는 걸로만 끝나지 않는 맛깔스러운 대화가 가득한 이곳에서 나의 입맛, 책맛 소울 메이트를 찾아보세요!', '2024-04-13 10:00:00', '함주호 님', 15, 14, '마감임박', '99a84a0a-c381-401c-82e2-20a80544d8f9.미식독서.png', NULL, NULL, '6e2bd488-79da-41eb-816d-678bcb50cedf_99a84a0a-c381-401c-82e2-20a80544d8f9.미식독서.png', NULL, NULL, '2024-03-05 16:47:11', NULL);

-- 독서모임　카테고리　데이터
INSERT INTO `bh_club_cate` (`cate`, `cateName`) VALUES
	(1, '커리어 성장'),
	(2, '예술과 문학'),
	(3, '금융/경제/투자'),
	(4, '영화와 책'),
	(5, '과학과 철학'),
	(6, '기타');

-- 독서모임　회원　데이터
INSERT INTO `bh_member` (`userName`, `password`, `name`, `gender`, `phone`, `email`, `role`, `point`, `zip`, `addr1`, `addr2`, `status`, `wdate`, `rdate`) VALUES
	('hansan', '$2a$10$uB7kWc8Z4Dzam3mkGpNRFewdjSQKKJKEE9xEznR5deplTPN7vD8xO', '박한산', 1, '010-8367-7710', 'hansani9611@naver.com', 'USER', 115000, '', '', '', 0, NULL, '2024-03-04 12:52:43'),
	('host1', '$2a$10$LlXITMxa85jv58A2zevBg.pfww7T.kgCF5Ue2xTkmfCB03Pf092Wy', '호스트', 1, '010-1234-1111', 'hansani9611@naver.com', 'USER', 410000, '', '', '', 0, NULL, '2024-03-05 14:50:34');






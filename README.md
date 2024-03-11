# 📖 도서관 웹 서비스 BOOKHUB
![image](https://github.com/bugger0330/BookHub/assets/126323071/06435db1-c07b-4f24-8948-99b9aca6e2ef)

<br>

## 프로젝트 소개
- BookHub는 인터넷 도서관 형태의 서비스이며 책을 좋아하는 사람이라면 누구나 이용가능한 서비스를 만들기위해 이 프로젝트를 기획하였습니다.
- 도서 검색을 통해 책을 검색할 수 있습니다.
- 도서 반납, 대출 기능을 이용하여 도서를 대출 받을 수 있습니다.
- 모임을 개설하여 독서 토론을 할 수 있습니다.
- 관리자 페이지에서 광고 배너, 포인트 상품 등록, 포인트 상품 결제 취소 처리를 할 수 있습니다.
- 소셜 로그인(구글, 카카오, 네이버)기능을 구현하였습니다.
- 포인트를 이용하여 다양한 상품을 구매할 수 있습니다.

<br>

## 팀원 구성
![image](https://github.com/bugger0330/BookHub/assets/126323071/aae290f1-c685-40b8-82ca-8beb678aac09)

<br>

## 개발환경
- 개발 툴 : Spring Tools 4 (4.21.1)
- Backend : JAVA 17, SpringBoot 3.1.8, MyBatis, JSP
- 버전/이슈관리 : GitHub, GitBash
- 협업 툴 : Discord, Notion
- 외부 API : 포트원 결제 API, 카카오, 구글, 네이버 소셜로그인 API, 클로버 챗봇 API

<br>

## 브랜치 전략
Git-flow 전략을 기반으로 main, develop 브랜치와 feature 보조 브랜치를 운용했습니다.
- main, develop, Feat 브랜치로 나누어 개발을 하였습니다.
- main 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
- develop 브랜치는 개발 단계에서 git-flow의 master 역할을 하는 브랜치입니다.
- Feat 브랜치는 기능 단위로 독립적인 개발 환경을 위하여 사용하고 merge 후 각 브랜치를 삭제해주었습니다.

<br>

## ⚙ 의존성
```java
implementation 'org.springframework.boot:spring-boot-starter-jdbc'
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
compileOnly 'org.projectlombok:lombok'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
annotationProcessor 'org.projectlombok:lombok'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:3.0.3'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
implementation group: 'org.glassfish.web', name: 'jakarta.servlet.jsp.jstl', version: '2.0.0'
implementation 'com.mysql:mysql-connector-j'
implementation 'com.googlecode.json-simple:json-simple:1.1.1'
implementation 'com.github.iamport:iamport-rest-client-java:0.1.6'
implementation 'org.springframework.boot:spring-boot-starter-security:3.2.2'
testImplementation 'org.springframework.security:spring-security-test'
implementation 'org.springframework.boot:spring-boot-starter-validation'
implementation 'org.springframework.boot:spring-boot-starter-mail'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
implementation 'org.springframework.security:spring-security-taglibs:6.2.2' 
implementation 'org.springframework.boot:spring-boot-starter-websocket'  
implementation 'org.springframework.boot:spring-boot-starter-oauth2-client:3.2.2'
```
<br>

## 1️⃣ 프로젝트 구조

<details>
    <summary>⚡️ 구조 자세히 살펴보기</summary>
    
    📦src
     ┗ 📂main
       ┣ 📂java
       ┃ ┗ 📂com
       ┃   ┗ 📂library
       ┃     ┗ 📂bookhub
       ┃       ┃ ┗ 📂config
       ┃       ┃ ┗ 📂entity
       ┃       ┣ 📂handler
       ┃       ┃ ┗ 📂exception
       ┃       ┃ ┗ 📂repository
       ┃       ┣ 📂security
       ┃       ┃ ┗ 📂oauth
       ┃       ┃ ┗ 📂service
       ┃       ┃ ┗ 📂utils
       ┃       ┣ 📂web
       ┃       ┃ ┗ 📂controller
       ┃       ┃   ┣ 📂api
       ┃       ┃   ┗ 📂page
       ┃       ┃ ┗ 📂dto
       ┣ 📂resources
       ┃ ┣ 📂db
       ┃ ┣ 📂mapper
       ┃ ┗ 📂static
       ┃   ┣ 📂css
       ┃   ┃ ┣ 📂book
       ┃   ┃ ┣ 📂calendar
       ┃   ┃ ┣ 📂chat
       ┃   ┃ ┣ 📂club
       ┃   ┃ ┣ 📂cs
       ┃   ┃ ┣ 📂myPage
       ┃   ┃ ┗ 📂share
       ┃   ┣ 📂img
       ┃   ┃ ┣ 📂book
       ┃   ┃ ┣ 📂calendar
       ┃   ┃ ┣ 📂club
       ┃   ┃ ┣ 📂error
       ┃   ┃ ┣ 📂point
       ┃   ┃ ┗ 📂share
       ┃   ┗ 📂js
       ┃     ┣ 📂admin
       ┃     ┣ 📂book
       ┃     ┣ 📂calendar
       ┃     ┣ 📂chat
       ┃     ┣ 📂club
       ┃     ┣ 📂cs
       ┃     ┣ 📂myPage
       ┃     ┣ 📂point
       ┃     ┣ 📂pointshop
       ┃     ┣ 📂share
       ┃     ┗ 📂user
       ┃   ┗ 📂lib
       ┗ 📂webapp
         ┗ 📂WEB-INF
           ┗ 📂view
             ┣ 📂layout
             ┣ 📂pages
               ┣ 📂about
               ┣ 📂admin
               ┣ 📂book
               ┣ 📂chat
               ┣ 📂club
               ┣ 📂cs
               ┣ 📂error
               ┣ 📂myPage
               ┣ 📂notice
               ┣ 📂openArea
               ┣ 📂payment
               ┣ 📂point
               ┣ 📂pointshop
               ┣ 📂share
               ┣ 📂subproduct
               ┗ 📂user
             ┗ 📂user

    
</details>
    
<br>

## 2️⃣ 프로젝트 개요

* 핵심 기능이 많으며 실무에서 활용할 수 있는 기능이 포함된 것들 중, 예약, 환불, 외부 API를 활용할 수 있는 도서관 + 독서모임 사이트로 주제 선정

<br>

## 3️⃣ ERD
<br>

![image](https://github.com/bugger0330/BookHub/assets/101609520/1105d441-87d8-4585-80a3-f9c586373d2f)


<br>

## 4️⃣ SiteMap
<br>

![image](https://github.com/bugger0330/BookHub/assets/92834334/ff87f797-bae2-40b3-9358-df7f4f8707ca)

<br>

## 역할 분담
#😎 강민(팀장)
|도서목록|도서상세(대출)|
|------|------|
|![도서목록](https://github.com/bugger0330/BookHub/assets/126323071/2e7c5f90-460f-4f6f-a132-e7a0fde43392)|![도서대출](https://github.com/bugger0330/BookHub/assets/126323071/15e61a5f-74c3-4d7c-9e13-1b0c2b7bc29f)|

|도서반납|도서서가위치인쇄|도서검색|
|------|------|------|
|![도서반납](https://github.com/bugger0330/BookHub/assets/126323071/433ad34f-276c-4888-9459-fcc6ff9116e1)|![도서서가위치](https://github.com/bugger0330/BookHub/assets/126323071/bb46a5c1-8b1a-4342-9256-90a3df845a45)|![도서검색](https://github.com/bugger0330/BookHub/assets/126323071/5f58e45a-6832-4ff4-bc02-bbdc8f5ab853)|

|카페/베이커리|PC사용|복사/프린트사용|
|------|------|------|
|![상품구매](https://github.com/bugger0330/BookHub/assets/126323071/b477bf72-d323-4560-9aee-bc538b1ec188)|![컴퓨터사용](https://github.com/bugger0330/BookHub/assets/126323071/ebad0dac-7c9c-46a5-bff3-58059d349655)|![복사,프린트사용](https://github.com/bugger0330/BookHub/assets/126323071/a2e3950e-b27c-4742-956f-4dc651b6f01c)|

|포인트상품 환불|서브 카테고리 트리|도서공유
|------|------|------|
|![포인트상품환불](https://github.com/bugger0330/BookHub/assets/126323071/cc805c0f-f23b-4d44-8c24-3bc677fe8cc8)|![사이드바](https://github.com/bugger0330/BookHub/assets/126323071/8879a7e2-4b51-4ecd-b7e4-8a3a3d82e523)|![도서공유](https://github.com/bugger0330/BookHub/assets/126323071/872f4ea9-8e02-49a0-ab5b-298b36eb3186)|


- 도서 목록/상세 페이지 및 대출/반납 기능을 구현했습니다. 반납 시 대출 기한을 넘기면 연체료를 내도록 하였습니다.
- 포인트를 이용하여 카페, 복사, 컴퓨터실 등에서 결제하여 이용할 수 있도록 구현했습니다.
- 도서 공유 기능을 구현하여 대여를 통해 수익을 발생 하도록 했습니다.
- 서브 카테고리 트리 기능을 구현하였습니다.


#😎 노수현
|공지사항|공지사항검색|문의하기|자주묻는질문|
|------|------|------|------|
|![도서반납](https://github.com/bugger0330/BookHub/assets/126323071/433ad34f-276c-4888-9459-fcc6ff9116e1)|![도서서가위치](https://github.com/bugger0330/BookHub/assets/126323071/bb46a5c1-8b1a-4342-9256-90a3df845a45)|![도서검색](https://github.com/bugger0330/BookHub/assets/126323071/5f58e45a-6832-4ff4-bc02-bbdc8f5ab853)|![자주묻는질문](https://github.com/bugger0330/BookHub/assets/126323071/b822f301-6bca-48c3-9702-70830a13868e)|
- 공지사항 (crud, 검색, 페이징)
- qna (crud, 페이징, 답변)
- faq (아코디언형식js)
  
#😎 송기동
|챗봇|회원정보수정/탈퇴|도서관소개|
|------|------|------|
|![챗봇](https://github.com/bugger0330/BookHub/assets/126323071/dcf5badb-9702-4ad2-83d1-e46fb11f1198)|![회원수정](https://github.com/bugger0330/BookHub/assets/126323071/f36e22bf-3ea7-4a2b-a9bf-e2aec7b78368) ![회원탈퇴](https://github.com/bugger0330/BookHub/assets/126323071/19d19e61-bb41-4950-919e-56ed20c79f83)|![도서관소개페이지](https://github.com/bugger0330/BookHub/assets/126323071/106ec07d-496c-4907-942f-7ef46be4ec8a)|
- 챗봇 기능
- 회원정보 수정/탈퇴
- 도서관소개 페이지

#😎 박한산
<table>
    <tr>
        <td>독서모임 개설</td>
        <td>독서모임 신청</td>
    </tr>
    <tr>
        <td><img src="https://github.com/bugger0330/BookHub/assets/136421972/cf83f94d-ea35-4c24-ba4f-653b0219de22"></td>
        <td><img src="https://github.com/bugger0330/BookHub/assets/136421972/87c0c9ea-8d25-40e9-9bbc-891558e6bf04"></td>
    </tr>
    <tr>
        <td>독서모임 찜하기</td>
        <td>독서모임 검색</td>
    </tr>
    <tr>
        <td><img src="https://github.com/bugger0330/BookHub/assets/136421972/aee7213f-a408-4c6f-a724-b324f15ab2f3"></td>
        <td><img src="https://github.com/bugger0330/BookHub/assets/136421972/13eee206-4dfe-4b23-9eaf-4c435f0cca8e"></td>
    </tr>
    <tr>
         <td>독서모임 카테고리 및 인기모임</td>
    </tr>
    <tr>
        <td><img src="https://github.com/bugger0330/BookHub/assets/136421972/aa226100-614a-4f61-a3bc-79fcef8cb824"></td>
    </tr>
</table>

#😎 이지민
|로그인|회원가입|이메일인증|출석체크|
|------|------|------|------|
|![로그인](https://github.com/bugger0330/BookHub/assets/126323071/a75d8432-1158-4cfb-a7e2-65bed809c45b)|![회원가입](https://github.com/bugger0330/BookHub/assets/126323071/f52243f1-3947-45f0-8e27-89060356ed98)|![회원가입_이메일인증](https://github.com/bugger0330/BookHub/assets/126323071/449510f6-fb20-4696-8ece-988d68ad623e)|![출첵](https://github.com/bugger0330/BookHub/assets/126323071/78ee4a17-aaed-40f0-83ce-b33209cb76d5)|

|아이디찾기|비밀번호찾기|
|------|------|
|![아이디찾기](https://github.com/bugger0330/BookHub/assets/126323071/c10b12a5-40e7-4f40-9bd6-201ae032f58d)|![비밀번호찾기](https://github.com/bugger0330/BookHub/assets/126323071/3c53e499-61ad-4688-af75-ce07c0d65329)|

#😎 이준혁
|포인트구매(결제API)|포인트상품추가|포인트상품 수정/삭제|
|------|------|------|
|![포인트구매](https://github.com/bugger0330/BookHub/assets/126323071/f55c86ca-f855-4af4-b96e-fa81174dfe4f)|![포인트상품추가](https://github.com/bugger0330/BookHub/assets/126323071/2e881b59-6418-4ff3-8320-92b3f79b8475)|![포인트상품수정삭제](https://github.com/bugger0330/BookHub/assets/126323071/06949030-3f15-4ff7-8a48-32dccb958a5c)|

|포인트환불|배너광고등록|
|------|------|
|![포인트환불](https://github.com/bugger0330/BookHub/assets/126323071/e78f798b-dce1-4dc5-923d-7b0c41102ef6)|![배너광고등록](https://github.com/bugger0330/BookHub/assets/126323071/4a5ab8af-d21f-4622-b33c-8cf81b66044c)|

|광고상태변경|광고수정/삭제|
|------|------|
|![광고상태변경](https://github.com/bugger0330/BookHub/assets/126323071/ee3b44b2-c5d0-41a1-afdc-4c4be6545a1d)|![광고수익확인, 광고수정삭제](https://github.com/bugger0330/BookHub/assets/126323071/f34c07d5-bc93-4657-b6b2-c36cf44e1c1a)|

- 메인페이지 전체 디자인
- 관리자페이지(상품등록, 배너광고 등록)
- 결제 기능

## 개발기간/작업관리
개발기간
- 2024.02.08 ~ 2024.03.08
작업관리
- 노션을 이용하여 그날 작업했던 내용을 기록하였습니다.
- 노션 주소 : https://phase-ground-168.notion.site/14c5a9ac94484ad29fdf3f0db3c4c613?v=d9e697a019a945f0a10048e72c89218e&pvs=4

![image](https://github.com/bugger0330/BookHub/assets/101609520/0797e525-9f8d-4c0a-bb65-191799fe8030)
![image](https://github.com/bugger0330/BookHub/assets/101609520/d573c147-0b46-4a53-b6c2-d44dd4fa911d)



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

![image](https://github.com/bugger0330/BookHub/assets/92834334/49df0846-ef3a-4e91-b4d6-206cb9541ee8)

<br>

## 4️⃣ SiteMap
<br>

![image](https://github.com/bugger0330/BookHub/assets/92834334/ff87f797-bae2-40b3-9358-df7f4f8707ca)

<br>

## 역할 분담
#😎 강민(팀장)
- 도서 목록/상세 페이지 및 대출/반납 기능을 구현했습니다. 반납 시 대출 기한을 넘기면 연체료를 내도록 하였습니다.
- 포인트를 이용하여 카페, 복사, 컴퓨터실 등에서 결제하여 이용할 수 있도록 구현했습니다.
- 도서 공유 기능을 구현하여 대여를 통해 수익을 발생 하도록 했습니다.
- 서브 카테고리 트리 기능을 구현하였습니다.

#😎 노수현
- 
#😎 송기동
-
#😎 박한산
- 
#😎 이지민
- 
#😎 이준혁
- 포트원 API 이용 상품 결제 구현
- [![시연영상](http://img.youtube.com/vi/YDWpmKiytrk/0.jpg)](https://youtu.be/YDWpmKiytrk)
-  [![시연영상](http://img.youtube.com/vi/PKw6_phIOQM/0.jpg)](https://youtu.be/PKw6_phIOQM)
- ![dsadsa](https://github.com/bugger0330/BookHub/assets/126323071/5fc89bdd-4a93-4251-8fe5-4d2fd908bac9)

## 개발기간/작업관리
개발기간
- 2024.02.08 ~ 2024.03.08
작업관리
- 노션을 이용하여 그날 작업했던 내용을 기록하였습니다.



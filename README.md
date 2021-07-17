# 오늘의친구
##### 팀원 : 김도영, 김영현, 오유진, 이은혜, 전계원, 정재만 (6명)
2021년 04월 23일 ~ 2021년 05월 18일(25일)
<br><br>

---
## Contents
1. [프로젝트 소개](#프로젝트-소개)
2. [설계의 주안점](#설계목표와-기대효과)
3. [개발환경](#개발환경)
4. [프로젝트 기능구현](#프로젝트-기능구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
<br>

---
## 프로젝트 소개
- 당근마켓을 모티브로 기획
- 같은 취미를 가진 친구를 같은 지역에서 만날 수 있는 지역 커뮤니티를 제공
<br>

---
## 설계목표와 기대효과
* 설계의 주안점
  - 지역 : 회원가입시 저장된 지역을 통하여 같은 지역 유저를 만날 수 있게한다.
  - 취미 : 지역 내 같은 취미를 가진 유저들의 만남을 연계한다.
  - 안정성 : 등급제도를 통한 안정성을 확보한다.

* 기대효과
  - 지역 커뮤니티의 활성화
  - 취미 커뮤니티의 활성화
<br>

---
## 개발환경

|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JavaScript, CSS3, JQuery|
|BackEnd|Java(JDK 1.8), Servlet, JSP|
|OS|Windows 10|
|IDE|Eclipse, VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud|
|CI|Github|
|DateBase|SQL Developer, Oracle(XE)|
|API|Google Charts, KaKao Channel, kakao Maps<br>tawk.to, 서울 열린데이터 광장|
<br>

---
## 프로젝트 기능구현
- 이은혜
  - 발표, 유즈케이스 작성, 관리자 페이지 공지사항, 로그인 아이디/ 비밀번호 찾기. DB 설계, SQL 정리, 게시글 포인트, 댓글 게시판, 검색 기능, 게시판 지역별, 취미별 분류, 페이징 처리, 에러 페이지
- 김영현
  - PPT, 포인트 게시판, 픽토그램 및 CSS, 댓글 게시판, 관리자 페이지 등급 관리, 댓글작성 시 포인트, 모든 이미지 작업, 화면 설계, 메인 페이지/ 로그인 페이지 모달 
- 정재만
  - 게시판 글 추가, 로그인 회원가입, 관리자 페이지, 관리자 페이지 회원 관리, 가입 유효성 검사, 마이 페이지 정보 수정 
- 김도영
  - 조장, 게시판 글 삭제/ 업데이트, API (지도, 채팅, 신고), 관리자 페이지, 게시글 관리/ 인기 분석 
- 전계원
  - 클래스 다이어그램, 회의록 작성, 공지사항 게시판, 마이 페이지 자신이 쓴 글/ 회원 탈퇴
- 오유진
  - 화면 설계, 발표 일정, 게시판 CSS, 이미지(후기 사진)
<br>

---
## 주요기능

**1. 메인페이지**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039404-9d84ee40-2030-4f82-8a09-bf0ae260368c.gif" width="700" height="400">
</p>

- ABOUT US 
- 후기글 조회


**2. 회원가입**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039408-eba50d11-2cf1-4fd1-b165-1eaa44e1bf5b.gif" width="700" height="400">
</p>

- 회원가입시 각 인풋창 유효성체크 후 false일경우 red색으로 메세지 안내
- 아이디/이메일 입력 후 중복확인 버튼 클릭시 중복확인창에 입력정보 확인
- 회원가입 완료시 Member테이블 데이터베이스 저장/아이디 비밀번호 입력 후 로그인


**3. 아이디/ 비밀 번호 찾기**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039412-542257c7-32fd-48d4-be1c-3671238c29f5.gif" width="700" height="400">
</p>

- 이름과 이메일 입력 후 NAME/EMAIL컬럼에서 정보조회 → 아이디/비밀번호 얼럿창으로 안내
- 정보 불일치시 회원 정보 입력을 다시 확인해주세요 라는 얼럿창 안내


**4. 친구 만나러 가기**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039026-67d7546b-6bef-4def-8d1e-8528ea3844f8.gif", width="700px">
</p>

- 제목과 내용입력(수정) 후 글등록(글수정) 및 삭제
- 제목과 내용의 입력한 키워드를 검색 후 검색결과 안내 및 조회


**5. 맛집 지도**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039183-94177566-1d0f-4034-bfee-cb62f1a106f2.gif" width="700" height="400">
</p>

- kakao 지도API


**6. 채팅**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039258-26da0920-bcea-4da0-8dad-01e447df1972.gif" width="700" height="400">
</p>

- tawk.to 채팅API 사용


**7. 관리자 페이지**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/79628668/126039256-b953b906-0bc5-4a06-abb0-aa3322fdfd96.gif" width="700" height="400">
</p>

- 공지사항 페이지(검색,등록,수정,삭제)
- 회원관리 페이지(검색,회원탈퇴)
- 등급관리 페이지(검색,등급업)
- 게시글관리 페이지(모든게시글)
- 인기글분석 페이지(해당카테고리의 게시글수를 그래프로 표현) -Google Chart API 사용




---
## Document
### 1. 개발일정
![chedule](https://user-images.githubusercontent.com/78994909/126037974-0eddddeb-7c73-4502-922a-6f3097ab0830.png) <br>
[5조오늘의친구스케줄표.xlsx](https://github.com/ehdud0314/semiproject/files/6834741/5.xlsx)

### 2. 유스케이스
![Usecase1](https://user-images.githubusercontent.com/78994909/126037845-ebdd9e69-77c2-4764-b270-2bde262dec4e.png)
![Usecase2](https://user-images.githubusercontent.com/78994909/126037858-efd16a25-24ea-4e42-8ca7-a919f3e9958d.png)

### 3. ERD
![물리적 설계](https://user-images.githubusercontent.com/78994909/126037674-6937205a-19d1-4fed-a37b-43e85bc22d94.jpg)
<br>


# KITRI_Best
## SpringBootSample
### 개요
spring boot와 MariaDB 연동시킨 테스트 프로젝트

### 개발환경
1. Eclipse
2. Java </br>
  jdk1.8 </br>
  jre 1.8
3. MariaDB </br>
  version 10.2

---

## demo
### 개요
spring boot와 MariaDB, jsp 연동시킨 게시판 (수정 중)
### 개발 환경
1. Eclipse
2. Java </br>
  jdk1.8 </br>
  jre 1.8
3. MariaDB </br>
  version 10.2

### 참고사항
1. testdb 의 members 테이블에 회원가입 정보 저장까지 구현
2. members 테이블 임시 구현 내용은 아래와 같음
> MariaDB에서 생성한 테이블  
#create table members( 
#	name varchar(20) not null, 
#	gender varchar(30) , 
#	age varchar(30), 
#	phone varchar(30), 
#	address varchar(30), 
#	email varchar(30), 
#	ID varchar(30) primary key, 
#	pwd varchar(30), 
#	likeit   varchar(30), 
#	agree  varchar(30), 
#	agree2 varchar(30) 
);
3. html에서 form 이용하여 controller로 직접 데이터 넘김(signin.jsp 사용하지 않음)

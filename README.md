# KITRI_Best

## **BestShop**
#### 개요
spring boot와 MariaDB, jsp 연동시킨 게시판 (수정 중)
#### 개발 환경
1. Eclipse
2. java </br>
   jdk1.8 </br>
   jre1.8 </br>
3. MariaDB </br>
   version 10.2

#### 참고 사항
1. web-server-application과 application.properties 의 password 차이
2. best_shop.members

#### check list
- [x] products 데이터베이스에서 main.jsp로 가져오는 기능 구현 (이미지 제외)
- [x] products 데이터베이스에서 detail.jsp로 가져오는 기능 구현 (이미지 제외)
- [ ] products 데이터베이스 top/bottom/bag&shoes/accesories 구분위한 컬럼 추가 고려
---
- [x] admin - user 삭제
- [x] admin - user 추가
- [x] admin - user 검색
- [ ] admin - user 수정

- [ ] delete/update/에서 없는 id 입력시 alert창 추가 필요
- [ ] AdminController에서 GET / POST 정리 필요
- [ ] admin에서 id 제외한 컬럼으로 검색 불가능
- [ ] 전체 user 목록 기능 추가 고려
- [ ] id 중복 경고 메시지
- [ ] 관리자 계정으로 로그인 시, 관리자 페이지 보여주기
- [ ] 로그인 성공시, main과 다른 페이지 보여주기(login 대신 logout 등)



## **demo**
#### 개요
spring boot와 MariaDB, jsp 연동시킨 게시판 (수정 중)
#### 개발 환경
1. Eclipse
2. Java </br>
  jdk1.8 </br>
  jre 1.8
3. MariaDB </br>
  version 10.2

#### 실행 방법
1. spring boot로 실행
2. localhost:8080/main.html 접속
3. signin 에서 회원가입 폼 작성까지
4. testdb 의 members 테이블 검색하여 확인

#### 참고사항
1. testdb 의 members 테이블에 회원가입 정보 저장까지 구현
2. members 테이블 임시 구현 내용은 아래와 같음
> MariaDB에서 생성한 테이블  
> create table members( 
	name varchar(20) not null, 
	gender varchar(30) , 
	age varchar(30), 
	phone varchar(30), 
	address varchar(30), 
	email varchar(30), 
	ID varchar(30) primary key,
	pwd varchar(30) not null,
	likeit   varchar(30), 
	agree  varchar(30), 
	agree2 varchar(30) 
);
3. html에서 form 이용하여 signin.jsp로 데이터 넘긴 후 sign.jsp에서 직접 데이터베이스에 삽입
``` java
request.setCharacterEncoding("UTF-8");
		
String name = request.getParameter("name");		
String age = request.getParameter("age");
String agree = request.getParameter("agree");
String agree2=request.getParameter("agree2");
String address=request.getParameter("address");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String ID = request.getParameter("ID");
String likeit = request.getParameter("likeit");
String phone = request.getParameter("phone");
String pwd = request.getParameter("pwd");
	
Connection conn = null;
PreparedStatement pstmt = null;		
		
try{
	// 연결할 db 정보
	String jdbcUrl="jdbc:mariadb://localhost:3306/testdb";
	String user = "root";
	String passwd = "1234";
			
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(jdbcUrl, user, passwd);
		   
	// 사용할 sql 문
	String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
		     		     		     
	pstmt.setString(1,name);
	pstmt.setString(2,gender);
	pstmt.setString(3,age);
	pstmt.setString(4,phone);
	pstmt.setString(5,address);
	pstmt.setString(6,email);
	pstmt.setString(7,ID);
	pstmt.setString(8,pwd);
	pstmt.setString(9,likeit);
	pstmt.setString(10,agree);
	pstmt.setString(11,agree2);
		     		     
	pstmt.executeUpdate();
		     
} catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt!=null){
	    	try{
	    		pstmt.close();
	    	}
	    	catch(SQLException sqle){}
	}
	if(conn != null) {
	    	try{
	    		conn.close();
	    	}
	    	catch(SQLException sqle){}
	}
}
```

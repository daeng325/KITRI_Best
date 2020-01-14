간단한 게시판 구현
==================

# 개요
Spring을 이용한 쇼핑몰 제작 전 간단한 게시판 제작

# 기간
2020.01.13 ~ 진행중

# 개발 환경
1. Eclipse 
	ver : IDE for Enterprise Java Developers - 2019-12
2. Java
	jdk1.8.0_231
	jre1.8.0_231
3. Oracle
	11g (11.2.0)
4. SQL Developer 
	19.4 (Windows 64-bit with JDK 8 included)
5. tomcat
	v8.5
	
# 내용
localhost:8080/board/writeView 접속시
제목, 내용, 작성자를 입력하고 작성 버튼을 누르면
데이터베이스에 내용이 저장된다.
저장된 내용은 sql 질의로 확인 가능하다.
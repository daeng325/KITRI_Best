# Best Shop

### 프로젝트 소개 

본 프로젝트는 OWASP Top 10 및 기타 알려진 취약점들에 대해 대응하기 위한 방안을 수립하기 위한 프로젝트로서, 첫 단계로 실제 소규모 쇼핑몰과 유사 또는 동일한 구조의 쇼핑몰을 구축하고, 직접 모의 해킹을 수행하여 발생할 수 있는 취약점을 확인하고자 한다. 다음으로 이전 단계에서 발생한 각 취약점에 대한 시큐어 코딩을 수행하여 취약점을 보완하여, 향후 유사한 사례에 적용할 수 있는 시큐어 코딩에 대한 가이드라인을 제시하고자 한다. 마지막으로, 모의 해킹 수행 시 웹 로그 분석을 통해 **시큐어 코딩**을 결과 어떻게 개선되었는지 확인하기 위한 모의 웹 침해사고 분석을 수행한다.

### 사용 환경 
Windows10 x64기반, Java 1.8.0 version,  Eclipse, Spring boot 2.3.2, jsp, 
MariaDB 10.2

## 실행 방법

#### Java, Eclipse 설치
[Oracle JDK 8 (Java 1.8.0 version) 설치 ](https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)
> 환경변수 설정 필요 

[Eclipse  설치]([https://www.eclipse.org/downloads/download.php?file=/oomph/epp/2019-12/R/eclipse-inst-win64.exe) 
> (Mirror Korea, Republic Of - [Daum Kakao Corp.])

#### Eclipse STS 설치
Eclipse Marketplace에서 STS 검색하면 맨 위에 나오는 **Spring Tools 3 Add-On for Spring Tools 4** 
** Spring Tools 4 (aka Spring Tool Suite 4) 4.5.1RELEASE** 다운로드

#### MariaDB 설치
[MariaDB 10.2 version 설치](https://downloads.mariadb.org/mariadb/10.2.31/)
MariaDB 10.2.31 Stable 의 64bit msi 파일 다운로드 
> 해당 프로젝트의 Maria DB root 계정 비밀번호 :  **1234**

만약 비밀번호를 다른 것으로 설정하고 싶다면 BestShop/src/main/resources/application.properties 의  **spring.datasource.password** 를 자신의 비밀번호로 변경해야 한다.

[참고 사이트](https://javaplant.tistory.com/31)



#### lombok 설치
[eclipse lombok 설치 참고 사이트](https://dev114.tistory.com/369)
> 설치 후 이클립스 재부팅 후 Maven Update 필요 

#### HeidiSQL
MySQL Client 
> create database best_shop
HeidiSQL을 실행 후 best_shop 데이터베이스 선택
 [파일]-> [SQL 파일 실행] 클릭 후 BestShop/DB/backup/에 있는 best_shop_backup0219.sql 파일 선택 후 실행 

#### keystore 생성 
[Spring Boot HTTPS 설정 참고 사이트 ](https://cheese10yun.github.io/spring-https/)

BestShop/src/main/resources/application.properties  변경 
> server.ssl.key-store: **keystore설정경로**
server.ssl.key-store-password: **본인이 설정한 패스워드**
server.ssl.keyStoreType: **keystore type**
server.ssl.keyAlias: **본인이 설정한 alias**
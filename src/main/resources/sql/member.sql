-- 회원 테이블
DROP TABLE IF EXISTS member;
CREATE TABLE member(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(40) NOT NULL,
	username VARCHAR(20) NOT NULL,
	passwd CHAR(12) NOT NULL,
	phone CHAR(13) NOT NULL,
	addr1 VARCHAR(100) NOT NULL,
	addr2 VARCHAR(100) NULL,
	agree CHAR(1) NOT NULL DEFAULT "N",
	grade CHAR(10) NOT NULL default "COMMON",
	regdate DATETIME
);

-- 관리자
INSERT INTO member VALUES(NULL, "admin@test.com", "관리자", "1234", "01012345678", "서울 강남구 가로수길 5", NULL, DEFAULT, "ADMIN", NOW());

-- 더미 데이터
INSERT INTO member(email, username, passwd, phone, addr1, addr2, agree, grade, regdate) (SELECT email, username, passwd, phone, addr1, addr2, agree, grade, regdate FROM member);
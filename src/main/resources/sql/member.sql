-- 회원테이블
DROP TABLE IF EXISTS member;
CREATE TABLE member(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(200) NOT NULL,
	username VARCHAR(100) NOT NULL,
	passwd VARCHAR(255) NOT NULL,
	phone CHAR(13) NOT NULL,
	addr1 VARCHAR(255) NOT NULL,
	addr2 VARCHAR(255) NULL,
	agree CHAR(2) NOT NULL DEFAULT "N",
	grade CHAR(10) NOT NULL default "common",
	regdate DATETIME
);


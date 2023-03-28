-- 공지사항 테이블
DROP TABLE IF EXISTS notice;
CREATE TABLE notice(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(40) NOT NULL,
	category VARCHAR(15) NOT NULL,
	title VARCHAR(80) NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(20) NOT NULL,
	regdate DATETIME,
	hits INT NOT NULL DEFAULT 0
);

-- 더미 데이터
INSERT INTO notice(email, category, title, content, writer, regdate, hits) (SELECT email, category, title, content, writer, regdate, hits FROM notice);
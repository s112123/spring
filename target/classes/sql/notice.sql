-- 공지사항
DROP TABLE IF EXISTS notice;
CREATE TABLE notice(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category VARCHAR(50) NOT NULL,
	title VARCHAR(200) NOT NULL,
	content TEXT,
	writer VARCHAR(100) NOT NULL,
	regdate DATETIME,
	hits INT NOT NULL DEFAULT 0
);

-- 더미 데이터
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
SELECT * FROM notice ORDER BY id DESC;

INSERT INTO notice(category, title, content, writer, regdate, hits) (SELECT category, title, content, writer, regdate, hits FROM notice);


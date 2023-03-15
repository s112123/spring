-- 공지사항 테이블
DROP TABLE IF EXISTS notice;
CREATE TABLE notice(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category VARCHAR(15) NOT NULL,
	title VARCHAR(80) NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(20) NOT NULL,
	regdate DATETIME,
	hits INT NOT NULL DEFAULT 0
);

-- 더미 데이터
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
INSERT INTO notice VALUES(NULL, "일반정보", "안녕하세요", "ㅋㅋㅋㅋ", "관리자", NOW(), DEFAULT);
SELECT * FROM notice ORDER BY id DESC;

INSERT INTO notice(category, title, content, writer, regdate, hits) (SELECT category, title, content, writer, regdate, hits FROM notice);
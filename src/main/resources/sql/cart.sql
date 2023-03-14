-- 장바구니 테이블
DROP TABLE IF EXISTS cart;
CREATE TABLE cart(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(40) NOT NULL,
	pname VARCHAR(30) NOT NULL,
	price INT NOT NULL,
	qty INT NOT NULL DEFAULT 1,
	regdate DATETIME
);

-- 더미 데이터
INSERT INTO cart VALUES(NULL, "user@test.com", "steak1", 1000, DEFAULT, NOW());
INSERT INTO cart VALUES(NULL, "a1234@test.com", "steak2", 1200, 30, NOW());
INSERT INTO cart VALUES(NULL, "user@test.com", "steak2", 1200, 10, NOW());
SELECT * FROM cart ORDER BY id DESC;

INSERT INTO cart(email, pname, price, qty, regdate) (SELECT email, pname, price, qty, regdate FROM cart);
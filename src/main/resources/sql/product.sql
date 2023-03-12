-- 상품 테이블: 추후 이미지파일, 재고량 추가필요
DROP TABLE IF EXISTS product;
CREATE TABLE product(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category VARCHAR(50) NOT NULL,
	pname VARCHAR(150) NOT NULL,
	price INT NOT NULL,
	gram INT NOT NULL,
	kcal INT NOT NULL,
	origin VARCHAR(100),
	img VARCHAR(255),
	regdate DATETIME
);

-- 더미 데이터
INSERT INTO product VALUES(NULL, "STEAK", "steak1", 1000, 100, 1200, "국내산", NULL, NOW());
INSERT INTO product VALUES(NULL, "PASTA", "steak2", 1200, 100, 1200, "국내산", NULL, NOW());
SELECT * FROM product ORDER BY id DESC;

INSERT INTO product(category, pname, price, gram, kcal, origin, img, regdate) (SELECT category, pname, price, gram, kcal, origin, img, regdate FROM product);
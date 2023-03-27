-- 상품 테이블: 추후 이미지파일, 재고량 추가필요
DROP TABLE IF EXISTS product;
CREATE TABLE product(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category VARCHAR(15) NOT NULL,
	pname VARCHAR(30) NOT NULL,
	description VARCHAR(85) NOT NULL,
	price INT NOT NULL,
	gram INT NOT NULL,
	kcal INT NOT NULL,
	origin VARCHAR(10),
	img VARCHAR(255),
	regdate DATETIME
);
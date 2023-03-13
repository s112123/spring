package com.spring.app.entity;

import java.time.LocalDateTime;

public class Product {
	
	private int id;						//고유번호
	private String category;			//구분
	private String pname;				//상품명
	private String description;			//상품설명
	private int price;					//가격
	private int gram;					//용량
	private int kcal;					//칼로리
	private String origin;				//원산지
	private String img;					//상품이미지 파일
	private LocalDateTime regdate;		//등록일
	
	public Product() {}

	public Product(int id, String category, String pname, String description, int price, int gram, int kcal, String origin,
			String img, LocalDateTime regdate) {
		this.id = id;
		this.category = category;
		this.pname = pname;
		this.description = description;
		this.price = price;
		this.gram = gram;
		this.kcal = kcal;
		this.origin = origin;
		this.img = img;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getGram() {
		return gram;
	}

	public void setGram(int gram) {
		this.gram = gram;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}
	
}

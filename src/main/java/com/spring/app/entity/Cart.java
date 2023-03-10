package com.spring.app.entity;

import java.time.LocalDateTime;

public class Cart {
	
	private int id;						//번호
	private String email;				//회원이메일
	private String pname;				//제품명
	private int price;					//제품가격
	private int qty;					//제품수량
	private LocalDateTime regdate;		//추가시간
	
	public Cart() {}

	public Cart(int id, String email, String pname, int price, int qty, LocalDateTime regdate) {
		this.id = id;
		this.email = email;
		this.pname = pname;
		this.price = price;
		this.qty = qty;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}
	
}

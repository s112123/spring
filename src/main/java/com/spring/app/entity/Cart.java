package com.spring.app.entity;

import java.time.LocalDateTime;

public class Cart {
	
	private int id;						//번호
	private int pid;					//제품고유번호
	private String email;				//회원이메일
	private String pname;				//제품명
	private int price;					//제품가격
	private int qty;					//제품수량
	private String img;					//제품이미지
	private LocalDateTime regdate;		//추가일
	
	public Cart() {}

	public Cart(int id, int pid, String email, String pname, int price, int qty, String img, LocalDateTime regdate) {
		this.id = id;
		this.pid = pid;
		this.email = email;
		this.pname = pname;
		this.price = price;
		this.qty = qty;
		this.img = img;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
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

	@Override
	public String toString() {
		return "Cart [id=" + id + ", pid=" + pid + ", email=" + email + ", pname=" + pname + ", price=" + price
				+ ", qty=" + qty + ", img=" + img + ", regdate=" + regdate + "]";
	}
	
}

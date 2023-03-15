package com.spring.app.entity;

import java.time.LocalDateTime;

public class Order {
	
	private int id;						//고유번호
	private String code;				//주문번호
	private String email;				//이메일
	private String title;				//주문명
	private int total;					//주문금액
	private LocalDateTime regdate;		//주문일
	
	public Order() {}

	public Order(int id, String code, String email, String title, int total, LocalDateTime regdate) {
		this.id = id;
		this.code = code;
		this.email = email;
		this.title = title;
		this.total = total;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", code=" + code + ", email=" + email + ", title=" + title + ", total=" + total
				+ ", regdate=" + regdate + "]";
	}
	
}





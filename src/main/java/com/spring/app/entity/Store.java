package com.spring.app.entity;

import java.time.LocalDateTime;

public class Store {
	
	private int id;
	private String storename;
	private String img;
	private String addr1;
	private String tel;
	private LocalDateTime regdate;
	
	public Store() {}
	
	public Store(int id, String storename, String img, String addr1, String tel, LocalDateTime regdate) {
		super();
		this.id = id;
		this.storename = storename;
		this.img = img;
		this.addr1 = addr1;
		this.tel = tel;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Store [id=" + id + ", storename=" + storename + ", img=" + img + ", addr1=" + addr1 + ", tel=" + tel
				+ ", regdate=" + regdate + "]";
	}

}

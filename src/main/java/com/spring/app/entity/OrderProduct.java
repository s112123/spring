package com.spring.app.entity;

public class OrderProduct {
	
	private int id;						//고유번호
	private String code;				//주문번호
	private String pname;				//상품명
	private int price;					//주문금액
	private int qty;					//주문수량
	private String img;					//상품이미지
	
	public OrderProduct() {}

	public OrderProduct(int id, String code, String pname, int price, int qty, String img) {
		this.id = id;
		this.code = code;
		this.pname = pname;
		this.price = price;
		this.qty = qty;
		this.img = img;
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

	@Override
	public String toString() {
		return "OrderProduct [id=" + id + ", code=" + code + ", pname=" + pname + ", price=" + price + ", qty=" + qty
				+ ", img=" + img + "]";
	}
	
}





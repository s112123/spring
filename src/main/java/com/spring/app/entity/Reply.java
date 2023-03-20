package com.spring.app.entity;

import java.time.LocalDateTime;

public class Reply {

	private int id;
	private int bid;
	private String content;
	private String writer;
	private LocalDateTime regdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public LocalDateTime getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Reply [id=" + id + ", bid=" + bid + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	
}

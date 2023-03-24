package com.spring.app.entity;

import java.time.LocalDateTime;

public class Board {
	
	private int id;
	private String email;
	private String category;
	private String title;
	private String content;
	private String writer;
	private int hits;
	private LocalDateTime regdate;
	
	public Board() {}

	public Board(int id, String email, String category, String title, String content, String writer, int hits,
			LocalDateTime regdate) {
		this.id = id;
		this.email = email;
		this.category = category;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.hits = hits;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {		
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", email=" + email + ", category=" + category + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", hits=" + hits + ", regdate=" + regdate + "]";
	}
	
}

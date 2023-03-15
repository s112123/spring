package com.spring.app.entity;

import java.time.LocalDateTime;

public class Notice {

	private int id;						//고유번호
	private String category;			//구분
	private String title;				//제목
	private String content;				//내용
	private String writer;				//작성자
	private LocalDateTime regdate;		//등록일
	private int hits;					//조회수
	
	public Notice() {}

	public Notice(int id, String category, String title, String content, String writer, LocalDateTime regdate,
			int hits) {
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.hits = hits;
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

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", category=" + category + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", regdate=" + regdate + ", hits=" + hits + "]";
	}
	
}

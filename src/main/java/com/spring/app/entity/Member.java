package com.spring.app.entity;

import java.time.LocalDateTime;

public class Member {
	
	private int id;						//고유번호
	private String email;				//이메일
	private String username;			//이름
	private String passwd;				//비밀번호
	private String phone;				//연락처
	private String addr1;				//기본주소
	private String addr2;				//상세주소
	private String agree;				//선택 동의여부
	private String grade;				//등급
	private LocalDateTime regdate;		//가입일
	
	public Member() {}
	
	public Member(int id, String email, String username, String passwd, String phone, String addr1, String addr2,
			String agree, String grade, LocalDateTime regdate) {
		this.id = id;
		this.email = email;
		this.username = username;
		this.passwd = passwd;
		this.phone = phone;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.agree = agree;
		this.grade = grade;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public LocalDateTime getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", email=" + email + ", username=" + username + ", passwd=" + passwd + ", phone="
				+ phone + ", addr1=" + addr1 + ", addr2=" + addr2 + ", agree=" + agree + ", grade=" + grade
				+ ", regdate=" + regdate + "]";
	}
	
}

package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Member;

public interface MemberService {

	//전체회원조회
	public List<Member> getMembers();
	
	//회원등록
	public void addMember(Member member);
	
	//회원조회: id
	public Member getMemberById(int id);
	
}

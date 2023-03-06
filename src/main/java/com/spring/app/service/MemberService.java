package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Member;

public interface MemberService {
	
	//전체목록
	public List<Member> getMembers();
	
	//등록
	public void addMember(Member member);
	
	//상세보기: id
	public Member getMemberById(int id);
	
	
}

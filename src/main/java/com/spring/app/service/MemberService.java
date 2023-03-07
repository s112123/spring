package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;

public interface MemberService {

	//전체 회원수
	public int getTotalMembers();
	
	//전체목록
	public List<Member> getMembers(Pagenation pagenation);
	
	//등록
	public void addMember(Member member);
	
	//상세보기: id
	public Member getMemberById(int id);
	
	//수정
	public void modifyMember(Member member);
	
	//삭제
	public void removeMember(int id);
	
}

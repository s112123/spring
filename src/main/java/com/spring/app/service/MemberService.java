package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;

public interface MemberService {

	//전체회원수
	public int getTotalMembers();
	
	//전체회원
	public List<Member> getMembers(Pagenation pagenation);
	
	//회원조회
	public Member getMemberByEmail(String email);
	
	//회원등록
	public void insertMember(Member member);
	
	//회원정보
	public Member getMemberById(int id);
	
	//회원수정
	public void updateMember(Member member);
	
	//회원삭제
	public void deleteMember(int id);
	
}

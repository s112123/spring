package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	//전체 회원 수
	public int getTotalMembers() {
		return memberRepository.countAll();
	}
	
	//전체목록
	public List<Member> getMembers(Pagenation pagenation) {
		List<Member> members = memberRepository.selectAll(pagenation);
		return members;
	}
	
	//등록
	public void addMember(Member member) {
		memberRepository.insertOne(member);
	}
	
	//상세보기: id
	public Member getMemberById(int id) {
		Member member = memberRepository.selectOneById(id);
		return member;
	}
	
	//수정
	public void modifyMember(Member member) {
		memberRepository.updateOne(member);
	}
	
	//삭제
	public void removeMember(int id) {
		memberRepository.deleteOne(id);
	}
	
}
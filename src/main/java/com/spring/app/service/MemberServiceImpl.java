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
	
	//전체회원수
	public int getTotalMembers() {
		return memberRepository.countAll();
	}
	
	//전체회원
	public List<Member> getMembers(Pagenation pagenation) {
		List<Member> members = memberRepository.selectAll(pagenation);
		return members;
	}
	
	//회원조회
	@Override
	public Member getMemberByEmail(String email) {
		Member member = memberRepository.selectOneByEmail(email);
		return member;
	}
	
	//회원등록
	public void addMember(Member member) {
		memberRepository.insertOne(member);
	}
	
	//회원정보
	public Member getMemberById(int id) {
		Member member = memberRepository.selectOneById(id);
		return member;
	}
	
	//회원수정
	public void modifyMember(Member member) {
		memberRepository.updateOne(member);
	}
	
	//회원삭제
	public void removeMember(int id) {
		memberRepository.deleteOne(id);
	}
	
}
package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Member;
import com.spring.app.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRepository;

	//전체회원조회
	public List<Member> getMembers() {
		List<Member> members = memberRepository.selectAll();
		return members;
	}
	
	//회원등록
	public void addMember(Member member) {
		memberRepository.insert(member);
	}
	
	//회원조회: id
	public Member getMemberById(int id) {
		Member member = memberRepository.selectOneById(id);
		return member;
	}
	
}
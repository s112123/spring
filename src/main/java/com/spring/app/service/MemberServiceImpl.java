package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	//전체회원수
	@Override
	public int getTotalMembers() {
		return memberDao.countAll();
	}
	
	//전체회원
	@Override
	public List<Member> getMembers(Pagenation pagenation) {
		List<Member> members = memberDao.selectAll(pagenation);
		return members;
	}
	
	//회원조회
	@Override
	public Member getMemberByEmail(String email) {
		Member member = memberDao.selectOneByEmail(email);
		return member;
	}
	
	//회원등록
	@Override
	public void insertMember(Member member) {
		memberDao.insertOne(member);
	}
	
	//회원정보
	@Override
	public Member getMemberById(int id) {
		Member member = memberDao.selectOneById(id);
		return member;
	}
	
	//회원수정
	@Override
	public void updateMember(Member member) {
		memberDao.updateOne(member);
	}
	
	//회원삭제
	@Override
	public void deleteMember(int id) {
		memberDao.deleteOne(id);
	}
	
}
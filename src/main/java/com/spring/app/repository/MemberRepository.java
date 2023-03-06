package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Member;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSession sqlSession;

	//전체회원조회
	public List<Member> selectAll() {
		List<Member> members = sqlSession.selectList("member.selectAll");
		return members;
	}
	
	//회원등록
	public int insert(Member member) {
		int result = sqlSession.insert("member.insert", member);
		return result;
	}
	
	//회원조회: id 
	public Member selectOneById(int id) {
		Member member = sqlSession.selectOne("member.selectOneById", id);
		return member;
	}
	
}

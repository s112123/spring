package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSession sqlSession;

	//전체회원수
	public int countAll() {
		return sqlSession.selectOne("member.countAll");
	}
	
	//전체회원
	public List<Member> selectAll(Pagenation pagenation) {
		List<Member> members = sqlSession.selectList("member.selectAll", pagenation);
		return members;
	}
	
	//회원조회
	public Member selectOneByEmail(String email) {
		Member member = sqlSession.selectOne("member.selectOneByEmail", email);
		return member;
	}
	
	//회원등록
	public int insertOne(Member member) {
		int result = sqlSession.insert("member.insertOne", member);
		return result;
	}
	
	//회원정보
	public Member selectOneById(int id) {
		Member member = sqlSession.selectOne("member.selectOneById", id);
		return member;
	}
	
	//회원수정
	public int updateOne(Member member) {
		int result = sqlSession.update("member.updateOne", member);
		return result;
	}
	
	//회원삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("member.deleteOne", id);
		return result;
	}
	
}

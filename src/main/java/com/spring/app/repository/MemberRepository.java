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

	//전체 회원 수
	public int countAll() {
		return sqlSession.selectOne("member.countAll");
	}
	
	//전체목록
	public List<Member> selectAll(Pagenation pagenation) {
		List<Member> members = sqlSession.selectList("member.selectAll", pagenation);
		return members;
	}
	
	//등록
	public int insertOne(Member member) {
		int result = sqlSession.insert("member.insertOne", member);
		return result;
	}
	
	//상세보기: id
	public Member selectOneById(int id) {
		Member member = sqlSession.selectOne("member.selectOneById", id);
		return member;
	}
	
	//수정
	public int updateOne(Member member) {
		int result = sqlSession.update("member.updateOne", member);
		return result;
	}
	
	//삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("member.deleteOne", id);
		return result;
	}
	
}

package edu.kh.justgo.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.member.model.dto.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	public Member login(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.login", map);
	}

	// 회원가입
	public int join(Member inputMember) {
		return sqlSession.insert("memberMapper.join", inputMember);
	}

	// 회원탈퇴 진행
	public int deleteAccount(Member deleteMember) {
		return sqlSession.update("memberMapper.deleteMember", deleteMember);
	}
	
	// 회원번호 비밀번호 조회(진현씨랑 충돌 예상)
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectEncPw", memberNo);
	}
	
	// 회원탈퇴
	public int deleteAccount(int memberNo) {
		return sqlSession.update("memberMapper.deleteAccount", memberNo);
	}

}

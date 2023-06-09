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

	public int join(Member inputMember) {
		return sqlSession.insert("memberMapper.join", inputMember);
	}

	// 회원탈퇴 진행
	public int deleteAccount(Member deleteMember) {
		return sqlSession.update("memberMapper.deleteMember", deleteMember);
	}
	
	// 회원번호 비밀번호 조회(진현씨랑 충돌 예상)
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectEncPw2", memberNo);
	}
	
	// 회원탈퇴
	public int deleteAccount(int memberNo) {
		return sqlSession.update("memberMapper.deleteAccount", memberNo);
	}

	// 이메일 인증코드 만들기
	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("memberMapper.updateAuthkey", map);
	}

	// 이메일 인증코드 보내기
	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.update("memberMapper.insertAuthkey", map);
	}

}

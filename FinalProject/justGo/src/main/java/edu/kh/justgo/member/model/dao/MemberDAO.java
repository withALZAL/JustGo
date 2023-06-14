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

}

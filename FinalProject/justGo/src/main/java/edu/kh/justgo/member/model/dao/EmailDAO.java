package edu.kh.justgo.member.model.dao;

import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.member.model.dto.Member;

@Repository
public class EmailDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("emailMapper.updateAuthKey", map);
	}

	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.update("emailMapper.insertAuthKey", map);
	}

	public int checkAuthKey(Map<String, Object> paramMap) {
		return sqlSession.selectOne("emailMapper.checkAuthKey", paramMap);
	}
	
	public int pwConfirm(String newPw, String memberEmail) {
		
		Member member = new Member();
		member.setMemberEmail(memberEmail);
		member.setMemberPw(newPw);
		
		return sqlSession.update("emailMapper.changePw", member);
	}


}


package edu.kh.justgo.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.kh.justgo.member.model.dto.Member;

@Repository
public class MyPageDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int updateInfo(Member member) {
		return sqlSession.update("myPageMapper.updateInfo", member);
	}


  public String selectEncPw(int memberNo) { 
	  return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo); 
	  }
  
  
  public int changePw(String newPw, int memberNo) {
  
  Member member = new Member(); member.setMemberNo(memberNo);
  member.setMemberPw(newPw);
  
  return sqlSession.update("myPageMapper.changePw", member); }
  
  }
 


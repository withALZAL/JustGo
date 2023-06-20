package edu.kh.justgo.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.kh.justgo.member.model.dto.Member;

@Repository
public class MyPageDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 닉네임 변경
	public int updateNickname(Member updateMember) {
		return sqlSession.update("myPageMapper.updateNickname", updateMember);
	}
	
    // 비밀번호 조회
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);
	}
	
	// 비밀번호 변경
	public int changePw(String newPw, int memberNo) {
		
		Member member = new Member();
		member.setMemberNo(memberNo);
		member.setMemberPw(newPw);
		
		return sqlSession.update("myPageMapper.changePw", member);
	}

	// 프로필 이미지 변경(상준)
	public int updateProfileImage(Member loginMember) {
		return sqlSession.update("myPageMapper.updateProfileImage", loginMember);
	}

}

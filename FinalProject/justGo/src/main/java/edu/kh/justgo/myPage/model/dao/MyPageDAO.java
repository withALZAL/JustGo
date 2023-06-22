package edu.kh.justgo.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;
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

	// 내가 쓴 글 카운트(상준)
	public int postCount(int memberNo) {
		return sqlSession.selectOne("myPageMapper.postCount", memberNo);
	}
	// 내가 쓴 글 조회(상준)
	public List<Board> selectMyPostList(Pagination myPostPagination, int memberNo) {
		int offset = (myPostPagination.getCurrentPage()-1) * myPostPagination.getLimit(); // offset만큼 건너 뜀
		
		System.out.println("myPostPagination.getCurrentPage():" + myPostPagination.getCurrentPage()); // 잘 담김
		System.out.println("myPostPagination.getLimit():" + myPostPagination.getLimit()); // 잘 담김
		
		RowBounds rowBounds = new RowBounds(offset, myPostPagination.getLimit()); // offset으로 RowBound 객체 생성
		
		return sqlSession.selectList("myPageMapper.selectMyPostList", memberNo, rowBounds);
		
	}
	


}

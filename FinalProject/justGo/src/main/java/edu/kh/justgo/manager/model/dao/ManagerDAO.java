package edu.kh.justgo.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSessionTemplate sql;

	/**
	 * 관리자를 제외한 회원수 조회
	 * 
	 * @return result
	 */
	public int getMemberListCount() {
		return sql.selectOne("managerMapper.getMemberListCount");
	}

	/**
	 * 관리자를 제외한 회원목록 조회
	 * 
	 * @param pagination
	 * @return list
	 */
	public List<Member> selectMemberList(Pagination memberPagination) {

		int offset = (memberPagination.getCurrentPage() - 1) * memberPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, memberPagination.getLimit());
		return sql.selectList("managerMapper.selectMemberList", null, rowBounds);

	}

	/**
	 * 1:1문의 수 조회
	 * 
	 * @return result
	 */
	public int getAskListCount() {

		return sql.selectOne("managerMapper.getAskListCount");
	}

	/**
	 * 1:1문의 목록조회
	 * 
	 * @param pagination
	 * @return list
	 */
	public List<Feedback> selectAskList(Pagination askPagination) {

		int offset = (askPagination.getCurrentPage() - 1) * askPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, askPagination.getLimit());
		return sql.selectList("managerMapper.selectAskList", null, rowBounds);

	}

	/**
	 * 신고 수 조회
	 * 
	 * @return result
	 */
	public int getReportListCount() {

		return sql.selectOne("managerMapper.getReportListCount");
	}

	/**
	 * 신고목록 조회
	 * 
	 * @param reportPagination
	 * @return list
	 */
	public List<Report> selectReportList(Pagination reportPagination) {

		int offset = (reportPagination.getCurrentPage() - 1) * reportPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, reportPagination.getLimit());
		return sql.selectList("managerMapper.selectReportList", null, rowBounds);
	}

	/**
	 * 글 목록 조회하려는 회원count
	 * 
	 * @param memberNo
	 * @return
	 */
//	public int getPostMemberCount(int memberNo) {
//		return sql.selectOne("managerMapper.getPostMemberCount", memberNo);
//	}

	/**
	 * 회원별 글 목록 count
	 * 
	 * @param memberNo
	 * @return
	 */
	public int getMemberPostCount(int memberNo) {
		return sql.selectOne("managerMapper.getMemberPostCount", memberNo);
	}

	/**
	 * 회원별 글 목록 조회
	 * 
	 * @param memberPostPagination
	 * @param memberNo
	 * @return list
	 */
	public List<Board> selectMemberPostList(Pagination memberPostPagination, int memberNo) {
		int offset = (memberPostPagination.getCurrentPage() - 1) * memberPostPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, memberPostPagination.getLimit());
		return sql.selectList("managerMapper.selectMemberPostList", memberNo, rowBounds);
	}

	/**
	 * 글 목록 조회하려는 회원 조회
	 * 
	 * @param postMemberPagination
	 * @param memberNo
	 * @return list
	 */
	public Member selectPostMember(int memberNo) {
		return sql.selectOne("managerMapper.selectPostMemberList", memberNo);
	}

	/**
	 * 1:1문의 상세 조회 (회원 문의)
	 * 
	 * @param feedbackNo
	 * @return list
	 */
	public Feedback selectMemberAskList(int feedbackNo) {
		return sql.selectOne("managerMapper.selectMemberAskList", feedbackNo);
	}

	/**
	 * 1:1문의 상세조회(관리자 답변)
	 * 
	 * @param feedbackNo
	 * @return list
	 */
	public Feedback selectManagerAnswerList(int feedbackNo) {
		return sql.selectOne("managerMapper.selectManagerAnswerList", feedbackNo);
	}

	/**
	 * 1:1문의 관리자 답변 입력
	 * 
	 * @param feedbackNo
	 * @return result
	 */
	public int insertManagerAnswer(Feedback feedback) {
		return sql.update("managerMapper.insertManagerAnswer", feedback);
	}

	// 회원목록 검색 카운트조회
	public int getMemberListCount(Map<String, Object> paramMap) {
		return sql.selectOne("managerMapper.getMemberListCount_search", paramMap);
	}

	//회원목록 검색 리스트 조회
	public List<Member> selectMemberList(Pagination memberPagination, Map<String, Object> paramMap) {
		int offset = (memberPagination.getCurrentPage() - 1) * memberPagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, memberPagination.getLimit());
		return sql.selectList("managerMapper.selectMemberList_search", paramMap, rowBounds);
	}


	// 1:1문의 검색 목록 카운트
	public int getAskListCount2(Map<String, Object> paramMap) {
		return sql.selectOne("managerMapper.getAskListCount2_search", paramMap);
	}

	//1:1문의 검색 목록 리스트
	public List<Feedback> selectAskList2(Pagination askPagination, Map<String, Object> paramMap) {
		int offset = (askPagination.getCurrentPage() - 1) * askPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, askPagination.getLimit());
		return sql.selectList("managerMapper.selectAskList2_search", paramMap, rowBounds);
	}

	
	// 회원별 게시글 삭제
	public int deletePost(int boardNo) {
		return sql.update("managerMapper.deletePost", boardNo);
	}

	
	//회원별 게시글 복원
	public int restorePost(int boardNo) {
		return sql.update("managerMapper.restorePost", boardNo);
	}

	//회원 프로필페이지 이동
	public Member memberProfile(int memberNo) {
		return sql.selectOne("managerMapper.memberProfile", memberNo);
	}

	/** 회원 강제 탈퇴
	 * @param memberNo
	 * @return result
	 */
	public int deleteMember(int memberNo) {
		return sql.update("managerMapper.deleteMember", memberNo);
	}

	/** 회원 계정 복구
	 * @param memberNo
	 * @return result
	 */
	public int restoreMember(int memberNo) {
		return sql.update("managerMapper.restoreMember", memberNo);
	}
	
	
	
	

}

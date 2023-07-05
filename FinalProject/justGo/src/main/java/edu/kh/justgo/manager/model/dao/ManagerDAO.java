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

/**
 * @author gram
 *
 */
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

	/** 신고 검색 수
	 * @return
	 */
	public int getReportListCount2(Map<String, Object> paramMap) {
		return sql.selectOne("managerMapper.getReportListCount_search", paramMap);
	}

	/** 신고 검색 리스드
	 * @param reportPagination
	 * @return
	 */
	public List<Report> selectReportList2(Pagination reportPagination, Map<String, Object> paramMap) {
		int offset = (reportPagination.getCurrentPage() - 1) * reportPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, reportPagination.getLimit());
		return sql.selectList("managerMapper.selectReportList_search", paramMap, rowBounds);
	}


	/** 관리자 신고 처리
	 * @param map
	 * @return
	 */
	public int reportConfirm(Map<String, Object> map) {
		return sql.update("managerMapper.reportConfirm", map);
	}

	
	
	
	/** 운영자 수
	 * @return
	 */
	public int getManagerListCount() {
		return sql.selectOne("managerMapper.getManagerListCount");
	}

	/** 관리자 운영관리
	 * @param memberPagination
	 * @return
	 */
	public List<Member> managerMemberList(Pagination managerPagination) {
		int offset = (managerPagination.getCurrentPage() - 1) * managerPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, managerPagination.getLimit());
		return sql.selectList("managerMapper.managerMemberList", null, rowBounds);
	}

	/** 운영자 수 검색 count
	 * @return
	 */
	public int getManagerListCount_search(Map<String, Object> paramMap) {
		return sql.selectOne("managerMapper.getManagerListCount_search", paramMap);
	}

	
	
	/** 관리자 운영관리 검색
	 * @param memberPagination
	 * @return
	 */
	public List<Member> managerMemberList_search(Pagination managerPagination, Map<String, Object> paramMap) {
		int offset = (managerPagination.getCurrentPage() - 1) * managerPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, managerPagination.getLimit());
		return sql.selectList("managerMapper.managerMemberList_search", paramMap, rowBounds);
	}

	/**
	 * 대시보드1
	 * @return
	 */
	public int countAllMember() {	return sql.selectOne("managerMapper.countAllMember");}
	public int countAllManager() {	return sql.selectOne("managerMapper.countAllManager");}
	public int countOutMember() {	return sql.selectOne("managerMapper.countOutMember");}
	public int countAllPost() {	return sql.selectOne("managerMapper.countAllPost");}

	/**
	 * 대시보드3
	 * @return
	 */
	public int countTag1() {	return sql.selectOne("managerMapper.countTag1");}
	public int countTag2() {	return sql.selectOne("managerMapper.countTag2");}
	public int countTag3() {	return sql.selectOne("managerMapper.countTag3");}
	public int countTag4() {	return sql.selectOne("managerMapper.countTag4");}

	/** 대시보드2
	 * @return
	 */
	public int countFree() {	return sql.selectOne("managerMapper.countFree");}
	public int countQuestion() {return sql.selectOne("managerMapper.countQuestion");}
	public int countChina() {	return sql.selectOne("managerMapper.countChina");}
	public int countJapan() {	return sql.selectOne("managerMapper.countJapan");}
	public int countVietnam() {	return sql.selectOne("managerMapper.countVietnam");}
	public int countThai() {	return sql.selectOne("managerMapper.countThai");}
	public int countAustralia(){return sql.selectOne("managerMapper.countAustralia");}
	
	/**
	 * 대시보드4
	 * @return
	 */
//	public int countMember6monthsAgo() {return sql.selectOne("managerMapper.countMember6monthsAgo");}
//	public int countMember3monthsAgo() {return sql.selectOne("managerMapper.countMember3monthsAgo");}
//	public int countMember2monthsAgo() {return sql.selectOne("managerMapper.countMember2monthsAgo");}
//	public int countMember1monthsAgo() {return sql.selectOne("managerMapper.countMember1monthsAgo");}
//	public int countMember2weeksAgo() {return sql.selectOne("managerMapper.countMember2weeksAgo");}
//	public int countMember1weeksAgo() {return sql.selectOne("managerMapper.countMember1weeksAgo");}
//	public int countMemberToday() {return sql.selectOne("managerMapper.countMemberToday");}
//	
//	public int countPost6monthsAgo() {return sql.selectOne("managerMapper.countPost6monthsAgo");}
//	public int countPost3monthsAgo() {return sql.selectOne("managerMapper.countPost3monthsAgo");}
//	public int countPost2monthsAgo() {return sql.selectOne("managerMapper.countPost2monthsAgo");}
//	public int countPost1monthsAgo() {return sql.selectOne("managerMapper.countPost1monthsAgo");}
//	public int countPost2weeksAgo() {return sql.selectOne("managerMapper.countPost2weeksAgo");}
//	public int countPost1weeksAgo() {return sql.selectOne("managerMapper.countPost1weeksAgo");}
//	public int countPostToday() {return sql.selectOne("managerMapper.countPostToday");}
//	
//	public int countOut6monthsAgo() {return sql.selectOne("managerMapper.countOut6monthsAgo");}
//	public int countOut3monthsAgo() {return sql.selectOne("managerMapper.countOut3monthsAgo");}
//	public int countOut2monthsAgo() {return sql.selectOne("managerMapper.countOut2monthsAgo");}
//	public int countOut1monthsAgo() {return sql.selectOne("managerMapper.countOut1monthsAgo");}
//	public int countOut2weeksAgo() {return sql.selectOne("managerMapper.countOut2weeksAgo");}
//	public int countOut1weeksAgo() {return sql.selectOne("managerMapper.countOut1weeksAgo");}
//	public int countOutToday() {return sql.selectOne("managerMapper.countOutToday");}
//	
//	public int countReport6monthsAgo() {return sql.selectOne("managerMapper.countReport6monthsAgo");}
//	public int countReport3monthsAgo() {return sql.selectOne("managerMapper.countReport3monthsAgo");}
//	public int countReport2monthsAgo() {return sql.selectOne("managerMapper.countReport2monthsAgo");}
//	public int countReport1monthsAgo() {return sql.selectOne("managerMapper.countReport1monthsAgo");}
//	public int countReport2weeksAgo() {return sql.selectOne("managerMapper.countReport2weeksAgo");}
//	public int countReport1weeksAgo() {return sql.selectOne("managerMapper.countReport1weeksAgo");}
//	public int countReportToday() {return sql.selectOne("managerMapper.countReportToday");}

	/**
	 * 대시보드5
	 * @return
	 */
	public int report1() {return sql.selectOne("managerMapper.report1");}
	public int report2() {return sql.selectOne("managerMapper.report2");}
	public int report3() {return sql.selectOne("managerMapper.report3");}
	public int report4() {return sql.selectOne("managerMapper.report4");}
	public int report5() {return sql.selectOne("managerMapper.report5");}
	public int report6() {return sql.selectOne("managerMapper.report6");}
	public int report7() {return sql.selectOne("managerMapper.report7");}
	public int report8() {return sql.selectOne("managerMapper.report8");}

	
}

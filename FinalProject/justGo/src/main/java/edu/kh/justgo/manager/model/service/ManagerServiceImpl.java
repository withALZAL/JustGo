package edu.kh.justgo.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.common.utility.Util;
import edu.kh.justgo.manager.model.dao.ManagerDAO;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO dao;

	// 회원목록 조회
	@Override
	public Map<String, Object> selectMemberList(int cp) {

		int listCount = dao.getMemberListCount();

//		System.out.println("listCount : " +listCount);

		Pagination memberPagination = new Pagination(listCount, cp);

		List<Member> memberList = dao.selectMemberList(memberPagination);

		// pagination, memberList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberPagination", memberPagination);
		map.put("memberList", memberList);

//		System.out.println(map);

		return map;
	}

	// 1:1문의 목록조회
	@Override
	public Map<String, Object> selectAskList(int cp) {

		int askListCount = dao.getAskListCount();

//		System.out.println("askListCount : " + askListCount);

		Pagination askPagination = new Pagination(askListCount, cp);

		List<Feedback> askList = dao.selectAskList(askPagination);

		// pagination, askList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("askPagination", askPagination);
		map.put("askList", askList);

//		System.out.println(map);

		return map;
	}

	// 신고 목록조회
	@Override
	public Map<String, Object> selectReportList(int cp) {

		int reportListCount = dao.getReportListCount();

//		System.out.println("reportListCount : " + reportListCount);

		Pagination reportPagination = new Pagination(reportListCount, cp);

		List<Report> reportList = dao.selectReportList(reportPagination);

		// pagination, askList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("reportPagination", reportPagination);
		map.put("reportList", reportList);

//		System.out.println(map);

		return map;
	}

	
	
	// 회원별 글 목록 조회
	@Override
	public Map<String, Object> selectMemberPostList(int memberNo, int cp) {


		int memberPostCount = dao.getMemberPostCount(memberNo);

//		System.out.println("memberPostCount : " + memberPostCount);

		Pagination memberPostPagination = new Pagination(memberPostCount, cp);

		List<Board> memberPostList = dao.selectMemberPostList(memberPostPagination, memberNo);
		Member postMember = dao.selectPostMember(memberNo);

		// pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("memberPostPagination", memberPostPagination);
		map.put("memberPostList", memberPostList);
		map.put("postMember", postMember);

//      System.out.println(map);

		return map;
	}

	
	
	// 1:1문의 상세 조회(회원문의글)
	@Override
	public Feedback selectMemberAskList(int feedbackNo) {
		return dao.selectMemberAskList(feedbackNo);
	}

	// 1:1문의 상세 조회(관리자 답변)
	@Override
	public Feedback selectManagerAnswerList(int feedbackNo) {
		return dao.selectManagerAnswerList(feedbackNo);
	}

	// 1:1문의 관리자 답변 입력
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertManagerAnswer(Feedback feedback) {

		feedback.setAdminText(Util.XSSHandling(feedback.getAdminText()));

//		System.out.println(feedback);

		int result = dao.insertManagerAnswer(feedback);
//		System.out.println("result :" +result);
		return result;
	}

	// 회원 검색 목록조회
	@Override
	public Map<String, Object> selectMemberList(Map<String, Object> paramMap, int cp) {
		int listCount = dao.getMemberListCount(paramMap);

		Pagination memberPagination = new Pagination(listCount, cp);

		List<Member> memberList = dao.selectMemberList(memberPagination, paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberPagination", memberPagination);
		map.put("memberList", memberList);

		return map;
	}

	// 1:1 검색 목록조회
	@Override
	public Map<String, Object> selectAskList(Map<String, Object> paramMap, int cp) {

		int askListCount = dao.getAskListCount2(paramMap);

		Pagination askPagination = new Pagination(askListCount, cp);

		List<Feedback> askList = dao.selectAskList2(askPagination, paramMap);

		Map<String, Object> map = new HashMap<>();
		map.put("askPagination", askPagination);
		map.put("askList", askList);

		return map;
	}

	//회원별 게시글 삭제
	@Override
	public int deletePost(int boardNo) {
		return dao.deletePost(boardNo);
	}

	
	// 회원별 게시글 복원
	@Override
	public int restorePost(int boardNo) {
		return dao.restorePost(boardNo);
	}
	
	
	//회원 프로필페이지 이동
	@Override
	public Member memberProfile(int memberNo) {
		return dao.memberProfile(memberNo);
	}

	
	// 회원 강제탈퇴
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}
	
	
	// 회원 계정복구
	@Override
	public int restoreMember(int memberNo) {
		return dao.restoreMember(memberNo);
	}
	
	
	// 신고 검색목록
	@Override
	public Map<String, Object> selectReportList(Map<String, Object> paramMap, int cp) {
		int reportListCount = dao.getReportListCount2(paramMap);


		Pagination reportPagination = new Pagination(reportListCount, cp);

		List<Report> reportList = dao.selectReportList2(reportPagination, paramMap);

		// pagination, askList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("reportPagination", reportPagination);
		map.put("reportList", reportList);


		return map;
	}
	
	
	// 관리자 신고 처리
	@Override
	public int reportConfirm(int reportNo,  Member loginMember) {
		
		int memberNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("reportNo", reportNo);
		map.put("memberNo", memberNo);
		
		return dao.reportConfirm(map);
	}
	
	
}

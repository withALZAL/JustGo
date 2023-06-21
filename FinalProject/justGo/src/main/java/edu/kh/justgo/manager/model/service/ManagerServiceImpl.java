package edu.kh.justgo.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dao.ManagerDAO;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@Service
public class ManagerServiceImpl implements ManagerService{

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
		
		
		int postMemberCount = dao.getPostMemberCount(memberNo);
		
		int memberPostCount = dao.getMemberPostCount(memberNo);
		
//      System.out.println("memberPostCount : " + memberPostCount);
//      System.out.println("postMemberCount : " + postMemberCount);
        
        Pagination memberPostPagination = new Pagination(memberPostCount, cp);
        Pagination postMemberPagination = new Pagination(postMemberCount, cp);
        
        List<Board> memberPostList = dao.selectMemberPostList(memberPostPagination, memberNo);
        List<Member> postMemberList = dao.selectPostMemberList(postMemberPagination, memberNo);
        
        // pagination, boardList를 Map에 담아서 반환
        Map<String, Object> map = new HashMap<>();
        map.put("memberPostPagination", memberPostPagination);
        map.put("postMemberPagination", postMemberPagination);
        map.put("memberPostList", memberPostList);
        map.put("postMemberList", postMemberList);
        
//      System.out.println(map);
		
		return map;
	}
	
	
		
	
	
	
	// 1:1문의 상세조회
	@Override
	 public Feedback selectAskDetailList(int feedbackNo) {
		return dao.selectAskDetailList(feedbackNo);
	}
	
	
	



}

























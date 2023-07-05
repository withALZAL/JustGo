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
	
	
	
	// 관리자 운영관리 검색
	@Override
	public Map<String, Object> managerMemberList(Map<String, Object> paramMap, int cp) {
		int listCount = dao.getManagerListCount_search(paramMap);

//		System.out.println("listCount : " +listCount);

		Pagination managerPagination = new Pagination(listCount, cp);

		List<Member> managerList = dao.managerMemberList_search(managerPagination, paramMap);

		// pagination, memberList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerPagination", managerPagination);
		map.put("managerList", managerList);

//		System.out.println(map);

		return map;
	}
	
	
	// 관리자 운영관리
	@Override
	public Map<String, Object> managerMemberList(int cp) {
		int listCount = dao.getManagerListCount();

//		System.out.println("listCount : " +listCount);

		Pagination managerPagination = new Pagination(listCount, cp);

		List<Member> managerList = dao.managerMemberList(managerPagination);

		// pagination, memberList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerPagination", managerPagination);
		map.put("managerList", managerList);

//		System.out.println(map);

		return map;
	}

	// 대시보드1
	@Override
	public int countAllMember() {return dao.countAllMember();}
	@Override
	public int countAllManager() {return dao.countAllManager();}
	@Override
	public int countOutMember() {return dao.countOutMember();}
	@Override
	public int countAllPost() {return dao.countAllPost();}
	
	// 대시보드2
	@Override
	public int countFree() {return dao.countFree();}
	@Override
	public int countQuestion() {return dao.countQuestion();}
	@Override
	public int countChina() {return dao.countChina();}
	@Override
	public int countJapan() {return dao.countJapan();}
	@Override
	public int countVietnam() {return dao.countVietnam();}
	@Override
	public int countThai() {return dao.countThai();}
	@Override
	public int countAustralia() {return dao.countAustralia();}
	
	

	// 대시보드3
	@Override
	public int countTag1() {return dao.countTag1();}
	@Override
	public int countTag2() {return dao.countTag2();}
	@Override
	public int countTag3() {return dao.countTag3();}
	@Override
	public int countTag4() {return dao.countTag4();}

	// 대시보드5
	@Override
	public int report1() {return dao.report1();}
	@Override
	public int report2() {return dao.report2();}
	@Override
	public int report3() {return dao.report3();}
	@Override
	public int report4() {return dao.report4();}
	@Override
	public int report5() {return dao.report5();}
	@Override
	public int report6() {return dao.report6();}
	@Override
	public int report7() {return dao.report7();}
	@Override
	public int report8() {return dao.report8();}

	
	
	
	
	// 대시보드에 나타나는 회원수
	@Override
	public int countAllMember() {
		return dao.countAllMember();
	}
	
	
	// 대시보드에 나타나는 운영자수
	@Override
	public int countAllManager() {
		return dao.countAllManager();
	}
	
	
	// 대시보드에 나타나는 탈퇴회원 수
	@Override
	public int countOutMember() {
		return dao.countOutMember();
	}
	
	
	// 대시보드에 나타나는 게시글 수
	@Override
	public int countAllPost() {
		return dao.countAllPost();
	}
	
	
	
	
	// 대시보드에 나타나는 신고 카테고리 수(욕설)
	@Override
	public int countReportAbusive() {
		return dao.countReportAbusive();
	}
	
	// 대시보드에 나타나는 신고 카테고리 수(차별적 표현)
	@Override
	public int countReportDisparaging_expression() {
		return dao.countReportDisparaging_expression();
	}
	
	//대시보드에 나타나는 신고 카테고리 수(사칭)
	@Override
	public int countReportImpersonation() {
		return dao.countReportImpersonation();
	}
	
	//대시보드에 나타나는 신고 카테고리 수(광고성, 도배글)
	@Override
	public int countReportAdvertisement() {
		return dao.countReportAdvertisement();
	}
		
	
	
	// 대시보드에 나타나는 신고 카테고리 수(선정성)
	@Override
	public int countReportSensationality() {
		return dao.countReportSensationality();
	}
	
	
	//  대시보드에 나타나는 신고 카테고리 수(불법정보포함)
	@Override
	public int countReportIllegal_information() {
		return dao.countReportIllegal_information();
	}
	
	
	// 대시보드에 나타나는 신고 카테고리 수(개인정보노출)
	@Override
	public int countReportPersonal() {
		return dao.countReportPersonal();
	}
	
	
	
	// 대시보드에 나타나는 신고 카테고리 수(기타)
	@Override
	public int countReportEtc() {
		return dao.countReportEtc();
	}
	
	
	
	
	
}

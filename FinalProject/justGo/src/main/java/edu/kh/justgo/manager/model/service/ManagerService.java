package edu.kh.justgo.manager.model.service;

import java.util.Map;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.member.model.dto.Member;

public interface ManagerService {

	/** 회원목록 조회
	 * @param cp
	 * @return list
	 */
	Map<String, Object> selectMemberList(int cp);

	/** 1:1문의 목록조회
	 * @param cp
	 * @return list
	 */
	Map<String, Object> selectAskList(int cp);

	/** 신고 목록 조회
	 * @param cp
	 * @return list
	 */
	Map<String, Object> selectReportList(int cp);

	

    /** 회원별 글 목록 조회
     * @param memberNo
     * @param cp
     * @return list
     */
    Map<String, Object> selectMemberPostList(int memberNo, int cp);


	
	
	
	/**1:1문의 상세 조회(회원문의글)
	 * @param feedbackNo
	 * @return
	 */
	Feedback selectMemberAskList(int feedbackNo);

	/**1:1문의 상세 조회(관리자 답변)
	 * @param feedbackNo
	 * @return
	 */
	Feedback selectManagerAnswerList(int feedbackNo);

	
	
	
	/** 1:1문의 관리자 답변 입력
	 * @param feedback
	 * @return result
	 */
	int insertManagerAnswer(Feedback feedback);

	/** 회원목록 검색 기능
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectMemberList(Map<String, Object> paramMap, int cp);

	
	/** 1:1문의 검색 목록 
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectAskList(Map<String, Object> paramMap, int cp);
	
	

	/** 관리자 페이지의 회원 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	int deletePost(int boardNo);

	/** 관리자 페이지의 회원 게시글 복원
	 * @param boardNo
	 * @return
	 */
	int restorePost(int boardNo);

	
	/**회원 프로필페이지 이동
	 * @param memberNo
	 * @return 
	 */
	Member memberProfile(int memberNo);

	/** 회원 강제 탈퇴
	 * @param memberNo
	 * @return result
	 */
	int deleteMember(int memberNo);

	/** 회원계정 복구
	 * @param memberNo
	 * @return
	 */
	int restoreMember(int memberNo);

	/** 신고 검색 목록
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectReportList(Map<String, Object> paramMap, int cp);

	/** 관리자 신고 처리
	 * @param reportNo
	 * @param loginMember
	 * @return
	 */
	int reportConfirm(int reportNo, Member loginMember);

	/** 관리자 운영관리 페이지 검색
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> managerMemberList(Map<String, Object> paramMap, int cp);

	/** 관리자 운영관리 페이지
	 * @param cp
	 * @return
	 */
	Map<String, Object> managerMemberList(int cp);

//	/**
//	 * 대시보드1
//	 * @return
//	 */
//	int countAllMember();
//	int countAllManager();
//	int countOutMember();
//	int countAllPost();
//	
//	/**
//	 * 대시보드2
//	 * @return
//	 */
//	int countFree();
//	int countQuestion();
//	int countChina();
//	int countJapan();
//	int countVietnam();
//	int countThai();
//	int countAustralia();
//
//	/**
//	 * 대시보드3
//	 * @return
//	 */
//	int countTag1();
//	int countTag2();
//	int countTag3();
//	int countTag4();
//
//	/**
//	 * 대시보드5
//	 * @return
//	 */
//	int report1();
//	int report2();
//	int report3();
//	int report4();
//	int report5();
//	int report6();
//	int report7();
//	int report8();
//
//	/**
//	 * 대시보드4
//	 * @return
//	 */
//	int countMember6monthsAgo();
//	int countMember3monthsAgo();
//	int countMember2monthsAgo();
//	int countMember1monthsAgo();
//	int countMember2weeksAgo();
//	int countMember1weeksAgo();
//	int countMemberToday();
//	int countPost6monthsAgo();
//	int countPost3monthsAgo();
//	int countPost2monthsAgo();
//	int countPost1monthsAgo();
//	int countPost2weeksAgo();
//	int countPost1weeksAgo();
//	int countPostToday();
//	int countOut6monthsAgo();
//	int countOut3monthsAgo();
//	int countOut2monthsAgo();
//	int countOut1monthsAgo();
//	int countOut2weeksAgo();
//	int countOut1weeksAgo();
//	int countOutToday();
//	int countReport6monthsAgo();
//	int countReport3monthsAgo();
//	int countReport2monthsAgo();
//	int countReport1monthsAgo();
//	int countReport2weeksAgo();
//	int countReport1weeksAgo();
//	int countReportToday();


	
//	/** 대시보드에 나타나는 회원수
//	 * @return
//	 */
//	int countAllMember();
//
//	
//	/** 대시보드에 나타나는 운영자수
//	 * @return
//	 */
//	int countAllManager();
//
//	
//	/** 대시보드에 나타나는 탈퇴회원 수
//	 * @return
//	 */
//	int countOutMember();
//
//	
//	/** 대시보드에 나타나는 게시글 수
//	 * @return
//	 */
//	int countAllPost();
//
//	/**
//	 * @return
//	 */
//	int countReportAbusive();
//
//	/**
//	 * @return
//	 */
//	int countReportDisparaging_expression();
//
//	/**
//	 * @return
//	 */
//	int countReportImpersonation();
//
//	/**
//	 * @return
//	 */
//	int countReportAdvertisement();
//
//	/**
//	 * @return
//	 */
//	int countReportSensationality();
//
//	/**
//	 * @return
//	 */
//	int countReportIllegal_information();
//
//	/**
//	 * @return
//	 */
//	int countReportPersonal();
//
//	/**
//	 * @return
//	 */
//	int countReportEtc();

	


    

    
    
}

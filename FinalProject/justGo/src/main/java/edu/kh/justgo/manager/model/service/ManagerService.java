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


    

    
    
}

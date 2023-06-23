package edu.kh.justgo.manager.model.service;

import java.util.List;
import java.util.Map;

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




    
    
    /** 1:1문의 상세 조회
	 * @param feedbackNo
	 * @return list
	 */
//    public Feedback selectAskDetailList(int feedbackNo);

    



	
	
	
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

    

    
    
}

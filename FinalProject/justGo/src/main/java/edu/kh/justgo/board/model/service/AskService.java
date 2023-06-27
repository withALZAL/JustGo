package edu.kh.justgo.board.model.service;

import java.util.Map;

import edu.kh.justgo.manager.model.dto.Feedback;

public interface AskService {

	/** 로그인한 회원의 1:1문의 작성
	 * @param feedback
	 * @return result
	 */
	int insertAsk(Feedback feedback);

	/** 로그인한 회원의 1:1문의 삭제
	 * @param map 
	 * @param feedback
	 * @return result
	 */
	int deleteAsk(Feedback feedback);

	
	
}

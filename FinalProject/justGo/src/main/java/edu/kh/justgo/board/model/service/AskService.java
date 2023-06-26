package edu.kh.justgo.board.model.service;

import edu.kh.justgo.manager.model.dto.Feedback;

public interface AskService {

	/** 로그인한 회원의 1:1문의 작성
	 * @param feedback
	 * @return result
	 */
	int insertAsk(Feedback feedback);

	
	
}

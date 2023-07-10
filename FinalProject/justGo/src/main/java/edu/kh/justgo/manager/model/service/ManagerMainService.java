package edu.kh.justgo.manager.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;

public interface ManagerMainService {

	/** 오늘 가입자수, 신규글 수, 댓글 수
	 * @return
	 */
	Map<String, Integer> todaysCount();

	/** 1:1문의 Count
	 * @return
	 */
	Map<String, Integer> feedbackCount();

	/** 신고 Count
	 * @return
	 */
	Map<String, Integer> reportCount();

	/**최신글 List
	 * @return
	 */
	List<Board> newPost();

	/** 신규문의 List
	 * @return
	 */
	List<Feedback> newFeedback();
	
	


}

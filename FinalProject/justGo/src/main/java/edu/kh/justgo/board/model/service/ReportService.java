package edu.kh.justgo.board.model.service;


import edu.kh.justgo.manager.model.dto.Report;


public interface ReportService {

	/**  회원이 게시물 신고
	 * @param report
	 * @return 성공 시 1, 실패 시 0
	 */
	int reportBoard(Report report);

	/** 로그인한 회원이 이미 신고한 게시물인지 확인
	 * @param report
	 * @return
	 */
	int reportSelect(Report report);


	
	
	
	
}

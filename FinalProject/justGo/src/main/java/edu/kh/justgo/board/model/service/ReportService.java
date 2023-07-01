package edu.kh.justgo.board.model.service;


import edu.kh.justgo.manager.model.dto.Report;


public interface ReportService {

	/**  회원이 게시물 신고
	 * @param report
	 * @return 성공 시 1, 실패 시 0
	 */
	int reportBoard(Report report);


	
	
	
	
}

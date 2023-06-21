package edu.kh.justgo.board.model.service;

import edu.kh.justgo.board.model.dto.Board;

public interface WritingService {
	
	
	/** 게시글 삽입
	 * @param board
	 * @return boardNo
	 */
	int boardInsert(Board board);

	/** 게시글 수정 (자유/질문)
	 * @param board
	 * @return 
	 */
	int writingUpdate(Board board);

}

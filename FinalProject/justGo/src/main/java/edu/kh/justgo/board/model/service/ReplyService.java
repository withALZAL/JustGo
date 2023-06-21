package edu.kh.justgo.board.model.service;

import java.util.List;

import edu.kh.justgo.board.model.dto.Reply;

public interface ReplyService {
	
	// 댓글 목록 조회
	List<Reply> select(int boardNo);
	
	// 댓글 등록
	int insert(Reply reply);

	// 댓글 삭제
	int delete(int replyNo);
	
	// 댓글 수정
	int update(Reply reply);

}

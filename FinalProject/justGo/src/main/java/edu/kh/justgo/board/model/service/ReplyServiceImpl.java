package edu.kh.justgo.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dao.ReplyDAO;
import edu.kh.justgo.board.model.dto.Reply;
import edu.kh.justgo.common.utility.Util;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	private ReplyDAO dao;

	// 댓글 목록 
	@Override
	public List<Reply> select(int boardNo) {
		
		return dao.select(boardNo);
	}
	
	
	// 댓글 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insert(Reply reply) {	
		
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		
		
		return dao.insert(reply);
	}


	// 댓글 삭제
	@Override
	public int delete(int replyNo) {
		
		return dao.delete(replyNo);
	}


	// 댓글 수정
	@Override
	public int update(Reply reply) {
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		
		return dao.update(reply);
	}
	
	
	
	
	
	
	
	
}

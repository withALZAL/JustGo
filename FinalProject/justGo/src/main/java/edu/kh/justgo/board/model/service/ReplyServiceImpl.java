package edu.kh.justgo.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dao.ReplyDAO;
import edu.kh.justgo.board.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	private ReplyDAO dao;

	@Override
	public List<Reply> select(int boardNo) {
		
		return dao.select(boardNo);
	}
	
	
}

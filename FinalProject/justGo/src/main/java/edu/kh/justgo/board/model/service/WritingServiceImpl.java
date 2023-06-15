package edu.kh.justgo.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dao.WritingDAO;
import edu.kh.justgo.board.model.dto.Board;

@Service
public class WritingServiceImpl implements WritingService{

	@Autowired
	private WritingDAO dao;
	
	@Override
	public int boardInsert(Board board) {
		return dao.boardInsert(board);
	}

}

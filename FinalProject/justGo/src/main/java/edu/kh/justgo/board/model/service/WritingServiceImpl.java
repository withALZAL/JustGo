package edu.kh.justgo.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dao.WritingDAO;
import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.common.utility.Util;

@Service
public class WritingServiceImpl implements WritingService{

	@Autowired
	private WritingDAO dao;
	
	// 게시글 삽입
	@Override
	public int boardInsert(Board board) {
		return dao.boardInsert(board);
	}
	
	// 게시글 수정 (자유/ 질문)
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingUpdate(Board board) {
		
		// 1. 게시글 제목/내용만 수정
		// 1) XSS 방지 처리
		board.setBoardTitle( Util.XSSHandling(board.getBoardTitle() ) );
		board.setBoardText( Util.XSSHandling(board.getBoardText() ) );
		
		// 2) DAO 호출
		int result = dao.writingUpdate(board);
		
		
		return result;
	}
	
	// 게시글 수정(여행)
	@Override
	public int writingUpdate2(Board board) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle() ) );
		board.setBoardText(Util.XSSHandling(board.getBoardText() ) );
		
		int result  = dao.writingUpdate2(board);
		
		return result;
	}
	
	// 게시글 삭제(자유/질문)
	@Override
	public int writingDelete(Board board) {
		return dao.writingDelete(board);
	}

	// 게시글 삭제(여행)
	@Override
	public int wiritngDelete2(Board board) {
		return dao.writingDelete2(board);
	}
	

	
	


}

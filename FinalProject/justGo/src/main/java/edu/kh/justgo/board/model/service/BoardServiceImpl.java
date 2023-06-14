package edu.kh.justgo.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dao.BoardDAO;
import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	
	
	/** 게시판 목록
	 *
	 */
	@Override
	public List<Map<String, Object>> selectBoardTypeList() {
		
		return dao.selectBoardTypeList();
	}

	
	/** 국가 목록
	 *
	 */
	@Override
	public List<Map<String, Object>> selectCountryList() {
		
		return dao.selectCountryList();
	}


	/** 게시글 목록 조회
	 *
	 */
	@Override
	public Map<String, Object> selectBoardList(int boardCode, int cp) {
		
		int listCount = dao.listCount(boardCode);
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Board> boardList = dao.selectBoardList(pagination,boardCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination",pagination);
		map.put("boardList",boardList);
		
		return map;
	}
	
	

	
	
	
}

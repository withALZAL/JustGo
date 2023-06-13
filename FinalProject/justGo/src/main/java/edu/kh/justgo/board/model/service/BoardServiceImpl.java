package edu.kh.justgo.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	
	@Override
	public List<Map<String, Object>> selectBoardTypeList() {
		
		return dao.selectBoardTypeList();
	}


	@Override
	public List<Map<String, Object>> selectCountryList() {
		
		return dao.selectCountryList();
	}

	
	
	
}

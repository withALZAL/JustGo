package edu.kh.justgo.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.main.model.dao.MainDAO;
import edu.kh.justgo.main.model.dto.Main;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO dao;

	 @Override
	   public List<Main> hotBoard() {
	      return dao.hotBoard();
	   }

	@Override
	public List<Main> foodBoard() {
		return dao.foodBoard();
	}

	@Override
	public List<Main> tipBoard() {
		return dao.tipBoard();
	}

	@Override
	public List<Main> healBoard() {
		return dao.healBoard();
	}
	
	
}

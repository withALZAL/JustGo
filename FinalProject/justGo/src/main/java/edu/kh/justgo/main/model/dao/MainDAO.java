package edu.kh.justgo.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.main.model.dto.Main;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Main> hotBoard(){
	      return sqlSession.selectList("mainMapper.hotBoard");
	   }   
	
	
	
	
	
	
	
}

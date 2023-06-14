package edu.kh.justgo.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public List<Map<String, Object>> selectBoardTypeList() {
		
		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}

	public List<Map<String, Object>> selectCountryList() {
		
		return sqlSession.selectList("boardMapper.selectCountryList");
	}

}

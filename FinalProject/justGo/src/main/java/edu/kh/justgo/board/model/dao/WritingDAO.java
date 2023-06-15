package edu.kh.justgo.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;

@Repository
public class WritingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int boardInsert(Board board) {
		return sqlSession.insert("writingMapper.boardInsert",board);
	}

}

package edu.kh.justgo.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Reply;

@Repository
public class ReplyDAO {
	
	private SqlSessionTemplate sqlSession;

	public List<Reply> select(int boardNo) {
		
		return sqlSession.selectList("boardMapper.selectReplyList",boardNo);
	}

}

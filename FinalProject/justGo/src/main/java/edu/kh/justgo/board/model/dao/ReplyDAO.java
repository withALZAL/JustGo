package edu.kh.justgo.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Reply;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Reply> select(int boardNo) {
		
		return sqlSession.selectList("boardMapper.selectReplyList",boardNo);
	}

	public int insert(Reply reply) {
		
		 return sqlSession.insert("replyMapper.insert",reply);
	}

	public int delete(int replyNo) {
		
		return sqlSession.update("replyMapper.delete ",replyNo);
	}

	public int update(Reply reply) {
		
		return sqlSession.update("replyMapper.update",reply);
	}

}

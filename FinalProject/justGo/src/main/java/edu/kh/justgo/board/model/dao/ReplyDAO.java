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
	
	// 목록조회
	public List<Reply> select(int boardNo) {
		
		return sqlSession.selectList("boardMapper.selectReplyList",boardNo);
	}

	// 댓글 등록
	public int insert(Reply reply) {
		
		 return sqlSession.insert("replyMapper.insert",reply);
	}
	
	
	// 댓글 삭제
	public int delete(int replyNo) {
		
		return sqlSession.update("replyMapper.delete",replyNo);
	}
	
	// 댓글 수정 
	public int update(Reply reply) {
		
		return sqlSession.update("replyMapper.update",reply);
	}

}

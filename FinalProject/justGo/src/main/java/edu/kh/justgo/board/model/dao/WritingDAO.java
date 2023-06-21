package edu.kh.justgo.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;

@Repository
public class WritingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 게시글 삽입
	 * @param board
	 * @return result
	 */
	public int boardInsert(Board board) {
		return sqlSession.insert("writingMapper.boardInsert",board);
	}

	/** 게시글 수정 (자유/질문)
	 * @param board
	 * @return result
	 */
	public int writingUpdate(Board board) {
		return sqlSession.update("writingMapper.writingUpdate", board);
	}

}

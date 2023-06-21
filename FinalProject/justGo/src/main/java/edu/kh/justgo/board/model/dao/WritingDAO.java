package edu.kh.justgo.board.model.dao;

import java.util.List;

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

	/** 게시글 수정(여행)
	 * @param board
	 * @return result
	 */
	public int writingUpdate2(Board board) {
		return sqlSession.update("writingMapper.writingUpdate2", board);
	}

	/** 게시글 삭제(자유/질문)
	 * @param board
	 * @return result
	 */
	public int writingDelete(Board board) {
		return sqlSession.update("writingMapper.writingDelete",board);
	}

	/** 게시글 삭제 (여행)
	 * @param board
	 * @return result
	 */
	public int writingDelete2(Board board) {
		return sqlSession.update("writingMapper.writingDelete2", board);
	}

	/** 자유/질문 List
	 * @return list
	 */
	public List<Board> boardSelector() {
		return sqlSession.selectList("writingMapper.boardSelector");
	}

}

package edu.kh.justgo.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.BoardImage;

/**
 * @author ejck
 *
 */
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

	/** 이미지 삽입 (업로드한 이미지 (글 삽입 시))
	 * @param imgMap
	 */
	public void insertImage(Map<String, Object> imgMap) {
		sqlSession.insert("writingMapper.insertImage",imgMap);
	}
	
	/** 글쓰기 수정 시 boardNo을 조회해서 boardImg 이미지 삭제(자유/질문)
	 * @param board
	 * @return result
	 */
	public int writingDelete3(Board board) {
		return sqlSession.delete("writingMapper.writingDelete3", board);
	}

	/** 이미지 삽입 (업로드한 이미지 (글 수정 시 (자유/질문)) )
	 * @param imgMap
	 */
	public void insertImage2(Map<String, Object> imgMap) {
		sqlSession.insert("writingMapper.insertImage2",imgMap);
	}

	/** 글쓰기 수정 시 boardNo을 조회해서 boardImg 이미지 삭제(여행)
	 * @param board
	 * @return result
	 */
	public int writingDelete4(Board board) {
		return sqlSession.delete("writingMapper.writingDelete4", board);
	}

	/** 이미지 삽입 (업로드한 이미지 분류 (글 수정 시 (여행)))
	 * @param imgMap
	 */
	public void insertImage3(Map<String, Object> imgMap) {
		sqlSession.insert("writingMapper.insertImage3",imgMap);
	}
	
	
	/**
	 * 이미지 조회(삭제를 위한)
	 * @return
	 */
	public List<String> selectImageList() {
		return sqlSession.selectList("writingMapper.selectImageList");
	}

	

}

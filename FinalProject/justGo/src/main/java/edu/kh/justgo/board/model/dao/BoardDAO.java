package edu.kh.justgo.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시판 목록
	 * @return
	 */
	public List<Map<String, Object>> selectBoardTypeList() {
		
		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}

	
	
	/** 국가 목록
	 * @return
	 */
	public List<Map<String, Object>> selectCountryList() {
		
		return sqlSession.selectList("boardMapper.selectCountryList");
	}
	

	/** 특정 게시판의 목록 
	 * @param boardCode
	 * @return
	 */
	public int listCount(int boardCode) {
		
		return sqlSession.selectOne("boardMapper.listCount",boardCode); 
	}



	/** 현재 페이지에 해당하는 게시글 조회
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {
		
		int offset = (pagination.getCurrentPage()-1
				* pagination.getLimit());
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		
		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}


	
	/** 여행게시판의 목록
	 * @param countryNo
	 * @return
	 */
	public int countryCount(int countryNo) {
		
		return sqlSession.selectOne("boardMapper.countryCount",countryNo);
	}



	/** 여행자 게시판
 	 * @param pagination
	 * @param countryNo
	 * @return
	 */
	public List<Board> countryList(Pagination pagination, int countryNo) {
		
		int offset = (pagination.getCurrentPage()-1
				* pagination.getLimit());
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.countryList", countryNo, rowBounds);
	}


	// 게시글 확인
	public Board selectBoard(Map<String, Object> map) {
		
		return sqlSession.selectOne("boardMapper.selectBoard",map);
	}


	/** 여행게시판 상세게시글
	 * @param map
	 * @return
	 */
	public Board boardCountryDetail(Map<String, Object> map) {
		
		return sqlSession.selectOne("boardMapper.boardCountryDetail",map);
	}

	/** 좋아요 확인
	 * @param map
	 * @return
	 */
	public int boardLikeCheck(Map<String, Object> map) {
		
		return sqlSession.selectOne("boardMapper.boardLikeCheck",map);
	}



	/** 조회수 
	 * @param boardNo
	 * @return
	 */
	public int updateReadCount(int boardNo) {
		
		return sqlSession.update("boardMapper.updateReadCount",boardNo);
	}




}

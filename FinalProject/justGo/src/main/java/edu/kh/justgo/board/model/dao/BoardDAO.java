package edu.kh.justgo.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;

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

}

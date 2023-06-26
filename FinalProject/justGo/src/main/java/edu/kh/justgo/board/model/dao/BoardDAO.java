package edu.kh.justgo.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;
import edu.kh.justgo.manager.model.dto.Feedback;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
/**
 * @author kobco
 *
 */
@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 게시판 목록
	 * 
	 * @return
	 */
	public List<Map<String, Object>> selectBoardTypeList() {

		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}

	/**
	 * 국가 목록
	 * 
	 * @return
	 */
	public List<Map<String, Object>> selectCountryList() {

		return sqlSession.selectList("boardMapper.selectCountryList");
	}

	/**
	 * 특정 게시판의 목록
	 * 
	 * @param boardCode
	 * @return
	 */
	public int listCount(int boardCode) {

		return sqlSession.selectOne("boardMapper.listCount", boardCode);
	}

	/**
	 * 현재 페이지에 해당하는 게시글 조회
	 * 
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {

		int offset = ((pagination.getCurrentPage() - 1) * pagination.getLimit());

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}

	/**
	 * 여행게시판의 목록
	 * 
	 * @param countryNo
	 * @return
	 */
	public int countryCount(int countryNo) {

		return sqlSession.selectOne("boardMapper.countryCount", countryNo);
	}

	/**
	 * 여행자 게시판
	 * 
	 * @param pagination
	 * @param countryNo
	 * @return
	 */
	public List<Board> countryList(Pagination pagination, int countryNo) {

		int offset = ((pagination.getCurrentPage() - 1) * pagination.getLimit());

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.countryList", countryNo, rowBounds);
	}

	// 게시글 확인
	public Board selectBoard(Map<String, Object> map) {

		return sqlSession.selectOne("boardMapper.selectBoard", map);
	}

	/**
	 * 여행게시판 상세게시글
	 * 
	 * @param map
	 * @return
	 */
	public Board boardCountryDetail(Map<String, Object> map) {

		return sqlSession.selectOne("boardMapper.boardCountryDetail", map);
	}

	/**
	 * 좋아요 확인
	 * 
	 * @param map
	 * @return
	 */
	public int boardLikeCheck(Map<String, Object> map) {

		return sqlSession.selectOne("boardMapper.boardLikeCheck", map);
	}

	/**
	 * 조회수
	 * 
	 * @param boardNo
	 * @return
	 */
	public int updateReadCount(int boardNo) {

		return sqlSession.update("boardMapper.updateReadCount", boardNo);
	}

	/**
	 * 검색
	 * 
	 * @param paramMap
	 * @return
	 */
	public int listCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.listCount_search", paramMap);
	}

	/**
	 * 게시글 목록 조회 (검색)
	 * 
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> selectBoardList(Pagination pagination, Map<String, Object> paramMap) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectBoardList_search", paramMap, rowBounds);
	}

	public int insertBoardLike(Map<String, Integer> paramMap) {

		return sqlSession.insert("boardMapper.insertBoardLike", paramMap);
	}

	public int deleteBoardLike(Map<String, Integer> paramMap) {

		return sqlSession.delete("boardMapper.deleteBoardLike", paramMap);
	}

	public int countBoardLike(Integer boardNo) {

		return sqlSession.selectOne("boardMapper.countBoardLike", boardNo);
	}

	/**
	 * 여행게시판 검색 리스트
	 * 
	 * @param paramMap
	 * @return
	 */
	public int listCount2(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.listCount2_search", paramMap);
	}

	/**
	 * 여행게시판 검색
	 * 
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> selectCountryList(Pagination pagination, Map<String, Object> paramMap) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectCountryList_search", paramMap, rowBounds);
	}

	/**
	 * 전체게시판 검색
	 * 
	 * @param paramMap
	 * @return
	 */
	public int listCount3(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.listCount3_search", paramMap);
	}

	/**
	 * 전체게시판 리스트 검색
	 * 
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> selectAllList(Pagination pagination, Map<String, Object> paramMap) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectAllList_search", paramMap, rowBounds);
	}

	/**
	 * 태그 리스트
	 * 
	 * @return
	 */
	public List<Board> tagList() {
		return sqlSession.selectList("boardMapper.tagList");
	}

	/**
	 * 태그 리스트 카운트
	 * 
	 * @param map2
	 * @return
	 */
	public int taglistCount(Board board) {
		int result = sqlSession.selectOne("boardMapper.taglistCount", board);
		return result;
	}

	/**
	 * 태그 리스트 목록 조회
	 * 
	 * @param pagination
	 * @param map2
	 * @return
	 */
	public List<Board> tagBoardList(Pagination pagination, Board board) {

		int offset = ((pagination.getCurrentPage() - 1) * pagination.getLimit());

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.tagBoardList", board, rowBounds);
	}

	/**
	 * board 리스트 불러오기 (자유/질문)
	 * 
	 * @return List
	 */
	public List<Board> boardTypeList() {
		return sqlSession.selectList("boardMapper.boardTypeList");
	}

	/**
	 * board 리스트 불러오기 (여행)
	 * 
	 * @return
	 */
	public List<Board> boardTypeList2() {
		return sqlSession.selectList("boardMapper.boardTypeList2");
	}

	/**
	 * board 리스트 불러오기 (tag)
	 * 
	 * @return
	 */
	public List<Board> boardTypeList3() {
		return sqlSession.selectList("boardMapper.boardTypeList3");
	}

	public List<Board> writingList() {
		return sqlSession.selectList("boardMapper.writingList");

	}

	/**
	 * 로그인 한 회원의 1:1문의 갯수
	 * 
	 * @param memberNo
	 * @return result
	 */
	public int getAskListCount(int memberNo) {

		return sqlSession.selectOne("askMapper.getAskListCount", memberNo);
	}

	/**
	 * 로그인한 회원의 1:1문의 목록
	 * 
	 * @param askPagination
	 * @return list
	 */
	public List<Feedback> selectAskList(Pagination askPagination, int memberNo) {
		int offset = (askPagination.getCurrentPage() - 1) * askPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, askPagination.getLimit());
		return sqlSession.selectList("askMapper.selectAskList", memberNo, rowBounds);
	}

	/**
	 * 1:1문의 상세 조회 (회원 문의)
	 * 
	 * @param feedbackNo
	 * @return list
	 */
	public Feedback selectMemberAskList(int feedbackNo) {
		return sqlSession.selectOne("askMapper.selectMemberAskList", feedbackNo);
	}

	/**
	 * 1:1문의 상세조회(관리자 답변)
	 * 
	 * @param feedbackNo
	 * @return list
	 */
	public Feedback selectManagerAnswerList(int feedbackNo) {
		return sqlSession.selectOne("askMapper.selectManagerAnswerList", feedbackNo);
	}

	/**
	 * 여행게시판 태그별 리스트 조회 카운트
	 * 
	 * @param board
	 * @return
	 */
	public int tagCountrylistCount(Board board) {
		int result = sqlSession.selectOne("boardMapper.tagCountrylistCount", board);
		return result;
	}

	/** 여행 태그별 목록조회
	 * @param pagination
	 * @param board
	 * @return
	 */
	public List<Board> tagBoardCountryList(Pagination pagination, Board board) {
		int offset = ((pagination.getCurrentPage() - 1) * pagination.getLimit());

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.tagBoardCountryList", board, rowBounds);
	}

}

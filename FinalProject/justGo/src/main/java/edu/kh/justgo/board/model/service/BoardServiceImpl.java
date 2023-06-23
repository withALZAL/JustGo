package edu.kh.justgo.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dao.BoardDAO;
import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;

	/**
	 * 게시판 목록
	 *
	 */
	@Override
	public List<Map<String, Object>> selectBoardTypeList() {

		return dao.selectBoardTypeList();
	}

	/**
	 * 국가 목록
	 *
	 */
	@Override
	public List<Map<String, Object>> selectCountryList() {

		return dao.selectCountryList();
	}

	/**
	 * 게시글 목록 조회
	 *
	 */
	@Override
	public Map<String, Object> selectBoardList(int boardCode, int cp) {

		int listCount = dao.listCount(boardCode);

		Pagination pagination = new Pagination(listCount, cp);

		List<Board> boardList = dao.selectBoardList(pagination, boardCode);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

	/**
	 * 여행자 게시판 조회
	 *
	 */
	@Override
	public Map<String, Object> countryList(int countryNo, int cp) {

		int countryCount = dao.countryCount(countryNo);

		Pagination pagination = new Pagination(countryCount, cp);

		List<Board> boardList = dao.countryList(pagination, countryNo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

	/**
	 * 게시글 상세내용
	 *
	 */
	@Override
	public Board selectBoard(Map<String, Object> map) {

		return dao.selectBoard(map);
	}

	/**
	 * 좋아요 체크
	 *
	 */
	@Override
	public int boardLikeCheck(Map<String, Object> map) {

		return dao.boardLikeCheck(map);
	}

	/**
	 * 조회수
	 *
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReadCount(int boardNo) {

		return dao.updateReadCount(boardNo);
	}

	/**
	 * 여행게시판 상세글 조회
	 *
	 */
	@Override
	public Board boardCountryDetail(Map<String, Object> map) {

		return dao.boardCountryDetail(map);
	}

	/**
	 * 게시판 검색
	 *
	 */
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> paramMap, int cp) {
		int listCount = dao.listCount(paramMap); // 오버로딩
		Pagination pagination = new Pagination(listCount, cp);

		List<Board> boardList = dao.selectBoardList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>(); // time 추론--> 생략가능 앞 Map 이랑 같음
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

	
	/** 좋아요 처리
	 *
	 */
	@Override
	public int like(Map<String, Integer> paramMap) {
		
		int result = 0;
		if(paramMap.get("check")==0) { // 좋아요 상태 X
			// BOARD_LIKE테이블 insert
			result = dao.insertBoardLike(paramMap);
			
		}else {
			// Board_Like 테이블 DELETE 
			result = dao.deleteBoardLike(paramMap);
			
		}
		if(result == 0) return -1;
		
		int count = dao.countBoardLike(paramMap.get("boardNo"));
		
		return count;
	}

	/**  여행게시글 조회
	 *
	 */
	@Override
	public Map<String, Object> selectCountryList(Map<String, Object> paramMap, int cp) {
		int listCount2 = dao.listCount2(paramMap); // 오버로딩
		Pagination pagination = new Pagination(listCount2, cp);

		List<Board> boardList = dao.selectCountryList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>(); // time 추론--> 생략가능 앞 Map 이랑 같음
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

	@Override
	public Map<String, Object> selectAllList(Map<String, Object> paramMap, int cp) {
		int listCount3 = dao.listCount3(paramMap); // 오버로딩
		Pagination pagination = new Pagination(listCount3, cp);

		List<Board> boardList2 = dao.selectAllList(pagination, paramMap);

		Map<String, Object> map = new HashMap<>(); // time 추론--> 생략가능 앞 Map 이랑 같음
		map.put("pagination", pagination);
		map.put("boardList2", boardList2);
		
		return map;
	}
//태그 리스트
	@Override
	public List<Board> tagList() {
		return dao.tagList();
	}
//태그 리스트별 목록조회
//	@Override
//	public Map<String, Object> selectTagList(int tagNo, int cp) {
//		int listCount = dao.taglistCount(tagNo);
//
//		Pagination pagination = new Pagination(listCount, cp);
//
//		List<Board> boardList = dao.tagBoardList(pagination, tagNo);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pagination", pagination);
//		map.put("boardList", boardList);
//
//		return map;
//	}

	@Override
	public Map<String, Object> boardTagList1(Board board, int cp) {
		
		int taglistCount = dao.taglistCount(board);

		Pagination pagination = new Pagination(taglistCount, cp);

		List<Board> tagBoardList = dao.tagBoardList(pagination, board);
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("tagBoardList", tagBoardList);

		return map;
		
	}


	
}

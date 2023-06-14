package edu.kh.justgo.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.justgo.board.model.dto.Board;

public interface BoardService {

	// 게시판 이름 
	List<Map<String, Object>> selectBoardTypeList();

	// 여행게시판 내 국가 게시판 
	List<Map<String, Object>> selectCountryList();

	// 게시글 목록 조회
	Map<String, Object> selectBoardList(int boardCode, int cp);



}

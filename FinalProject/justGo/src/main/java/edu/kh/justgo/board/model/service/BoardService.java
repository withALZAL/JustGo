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

	// 나라게시판 게시글 조회
	Map<String, Object> countryList(int countryNo, int cp);
	
	// 게시글 상세내용
	Board selectBoard(Map<String, Object> map);

	// 좋아요 체크
	int boardLikeCheck(Map<String, Object> map);

	// 리드카운트
	int updateReadCount(int boardNo);

	// 여행게시판 상세글 조회
	Board boardCountryDetail(Map<String, Object> map);

	//목록게시판 조회
	Map<String, Object> selectBoardList(Map<String, Object> paramMap, int cp);

	// 좋아요 처리
	int like(Map<String, Integer> paramMap);

	//게시글 검색
	Map<String, Object> selectCountryList(Map<String, Object> paramMap, int cp);

	//전체게시글 검색
	Map<String, Object> selectAllList(Map<String, Object> paramMap, int cp);
	
	//태그 리스트로 가져오기
	List<Board> tagList();

//	//태그로 목록조회
//	Map<String, Object> selectTagList(int tagNo, int cp);

	//태그 리스트로 검색
	Map<String, Object> boardTagList1(Board board, int cp);


	//board타입 셀렉트 가져오기 (수정화면: 자유/질문)
	List<Board> boardTypeList();

	// board타입 셀렉트 가져오기 (수정 : 여행)
	List<Board> boardTypeList2();
	
	// board타입 셀렉트 가져오기 (자유/질문 : tag)
	List<Board> boardTypeList3();

	// board타입 셀렉트 가져오기 (글쓰기)
	List<Board> writingList();


}

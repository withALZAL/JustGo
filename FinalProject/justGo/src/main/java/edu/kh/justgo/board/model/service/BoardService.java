package edu.kh.justgo.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.justgo.board.model.dto.Board;

public interface BoardService {

	List<Map<String, Object>> selectBoardTypeList();

	List<Map<String, Object>> selectCountryList();



}

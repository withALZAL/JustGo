package edu.kh.justgo.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<Map<String, Object>> selectBoardTypeList();

	List<Map<String, Object>> selectCountryList();


}

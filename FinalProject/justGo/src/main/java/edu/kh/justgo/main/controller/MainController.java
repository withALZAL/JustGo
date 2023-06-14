package edu.kh.justgo.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.service.BoardService;
import edu.kh.justgo.main.model.dto.Main;
import edu.kh.justgo.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;

	@RequestMapping("/")
	public String mainForward(Model model) {
//	      인기 게시글 조회
		List<Main> hotBoardList = service.hotBoard();
		model.addAttribute("hotBoardList", hotBoardList);

		return "common/main";
	}

}

package edu.kh.justgo.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MainController {

	@RequestMapping("/")

	public String mainForward(Model model) {
//	      인기 게시글 조회
		List<Main> hotBoardList = service.hotBoard();
		model.addAttribute("hotBoardList", hotBoardList);

		List<Main> foodBoardList = service.foodBoard();
		model.addAttribute("foodBoardList", foodBoardList);
		
		List<Main> tipBoardList = service.tipBoard();
		model.addAttribute("tipBoardList", tipBoardList);

		List<Main> healBoardList = service.healBoard();
		model.addAttribute("healBoardList", healBoardList);


		return "common/main";
	}

}

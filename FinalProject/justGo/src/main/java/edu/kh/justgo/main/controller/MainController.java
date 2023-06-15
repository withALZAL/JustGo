package edu.kh.justgo.main.controller;

import java.security.Provider.Service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.justgo.main.model.dto.Main;
import edu.kh.justgo.main.model.service.MainService;
import edu.kh.justgo.manager.model.service.ManagerService;

@Controller 
public class MainController {
	
	@Autowired
	private MainService service;

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

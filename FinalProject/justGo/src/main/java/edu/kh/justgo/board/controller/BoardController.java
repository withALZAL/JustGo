package edu.kh.justgo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {

	// 공지사항 연결
	@GetMapping("/boardNotice")
	public String boardNotice() {
		return "/board/boardNotice";
	}
	
	
	
}

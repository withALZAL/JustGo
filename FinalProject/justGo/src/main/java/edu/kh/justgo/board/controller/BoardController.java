package edu.kh.justgo.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.board.model.service.BoardService;

@SessionAttributes({"loginMember"})
@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	public BoardService service;

  	// 공지사항 연결
	@GetMapping("/boardNotice")
	public String boardNotice() {
		return "/board/boardNotice";
	}
	
	// 1:1문의 연결(/board/4 버전)
	@GetMapping("/4")
	public String writingQuestion() {
		return "/writing/writingQuestion";
	}
	
}

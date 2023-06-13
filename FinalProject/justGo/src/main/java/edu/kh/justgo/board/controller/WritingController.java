package edu.kh.justgo.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.board.model.service.WritingService;

@SessionAttributes({"loginMember"})
@Controller
public class WritingController {
	
//	@Autowired
//	private WritingService service;
	
	
	// 1:1문의 쓰기 연결
	@GetMapping("/writing/writingQuestion")
	public String writingQuestion() {
		return "writing/writingQuestion";
	}
	
	// 글쓰기 연결
	@GetMapping("/writing/writingBoard")
	public String writingBoard() {
		return "writing/writingBoard";
	}

}

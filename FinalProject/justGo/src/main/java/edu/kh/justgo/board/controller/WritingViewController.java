package edu.kh.justgo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WritingViewController {
	
	@GetMapping("/writingView")
	public String writingView() {
		
		return "writing/writingView";
	}
}

package edu.kh.justgo.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.service.BoardService;

@Controller 
public class MainController {

	
	@RequestMapping("/")
	public String mainForward() {
		return "common/main";
	}
	
}

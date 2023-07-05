package edu.kh.justgo.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.chatting.model.service.ChattingService;


@SessionAttributes({"loginMember"})
@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService service;
	
	@GetMapping("/")
	public String chatting() {
		
		return "chatting/chatting";
	}

	
	
	
}

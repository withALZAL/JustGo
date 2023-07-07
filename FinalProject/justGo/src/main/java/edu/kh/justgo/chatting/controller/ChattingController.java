package edu.kh.justgo.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.chatting.model.dto.Message;
import edu.kh.justgo.chatting.model.service.ChattingService;
import edu.kh.justgo.member.model.dto.Member;


@SessionAttributes({"loginMember"})
@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService service;
	
	@GetMapping("/chatting")
	public String chatting(@SessionAttribute("loginMember") Member loginMember, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int chattingNo = 1;
		loginMember.setChattingNo(chattingNo);
		map.put("chattingNo", loginMember.getChattingNo());
		
		
		model.addAttribute("map",map);
		
		return "chatting/chatting";
	}
	
	@GetMapping(value="/chatting/selectMessage", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<Message> selectMessage(@RequestParam("chattingNo") int chattingNo){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("chattingNo", chattingNo);
		
		
		
		return service.selectMessage(paramMap);
	}

	
	
	
}

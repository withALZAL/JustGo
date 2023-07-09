package edu.kh.justgo.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.manager.model.service.DashboardService;
import edu.kh.justgo.manager.model.service.ManagerMainService;

@Controller
@RequestMapping("/manager")
@SessionAttributes({ "loginMember" })
public class ManagetMainController {
	
	@Autowired
	public ManagerMainService service;

	
	// 관리자 메인페이지 연결
 	@GetMapping("/managerMain")
 	public String managerMain(
 							Model model
 							, @RequestParam(value="cp", required=false, defaultValue="1") int cp
 							) {
 		

 		// 오늘 가입자수, 신규글 수, 댓글 수
 		Map<String, Integer> todaysCount = service.todaysCount();
 		model.addAttribute("todaysCount", todaysCount);
 		
 		// 1:1문의 Count
 		Map<String, Integer> feedbackCount = service.feedbackCount();
 		model.addAttribute("feedbackCount", feedbackCount);
 		
 		// 신고 Count
 		Map<String, Integer> reportCount = service.reportCount();
 		model.addAttribute("reportCount", reportCount);
 		
 		Map<String, Object> map = new HashMap<String, Object>();

 		//최신글 List
 		List<Board> newPost = service.newPost();
 		map.put("newPost", newPost);

 		// 신규문의 List
 		List<Feedback> newFeedback = service.newFeedback();
 		map.put("newFeedback", newFeedback);
 		
 		model.addAttribute("map", map);
 		
// 		System.out.println("map : " + map);
 		
 		return "/manager/managerMain";
 		
 	}	
 	


 	
 	
 	
 	
 	
 	
   
}

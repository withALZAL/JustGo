package edu.kh.justgo.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.service.ManagerService;
import edu.kh.justgo.member.model.dto.Member;

@RestController
@RequestMapping("/manager")
@SessionAttributes({ "loginMember" })
public class ManagerController2 {

	@Autowired
	private ManagerService service;
	
    
    
   
    // 1:1문의 관리자 답변 입력
    @PostMapping("/askManager_detail/{feedbackNo}")
    public int insertManagerAnswer(
    		@RequestBody  Feedback feedback
    		, @SessionAttribute("loginMember") Member loginMember
    		, @PathVariable("feedbackNo") int feedbackNo
    		) throws IllegalStateException, IOException{
    	
    	
    	
    	feedback.setAdminNo(loginMember.getMemberNo());
    	feedback.setFeedbackNo(feedback.getFeedbackNo());
    	
    	
    	int result = service.insertManagerAnswer(feedback);
    	
		return result;
    }
    
    
    
    
	

	
	
	
	
	
	
	
	
	
}

package edu.kh.justgo.board.controller;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.board.model.service.ReportService;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@RequestMapping("/board")
@SessionAttributes("loginMember")
@Controller
public class ReportController {
	
	@Autowired
	public ReportService service;
	
	
	// 회원이 게시물 신고
	@PostMapping("/reportBoardBtn/{boardNo}")
	@ResponseBody
    public int reportBoard(
    			@RequestBody  Report report
    		, @SessionAttribute("loginMember") Member loginMember
    		, @PathVariable("boardNo") int boardNo
    		) throws IllegalStateException, IOException{
		
		report.setMemberNo(loginMember.getMemberNo());
		report.setBoardNo(report.getBoardNo());
		
		System.out.println(report);
		
		int result = service.reportBoard(report);
		
    	return result;
    }
	
	
	

	
}
	
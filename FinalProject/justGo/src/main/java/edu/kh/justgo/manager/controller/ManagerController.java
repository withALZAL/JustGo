package edu.kh.justgo.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.justgo.manager.model.service.ManagerService;
import edu.kh.justgo.member.model.dto.Member;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private ManagerService service;
	
	
	// 회원관리 관리자페이지 연결
	@GetMapping("/memberManager")
	public String selectMemberList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			, Model model
			) {
		
		// 회원정보 불러오기
		Map<String, Object> map = service.selectMemberList(cp);
		
		model.addAttribute("map", map);
		
		// 콘솔에서 확인
//		System.out.println(memberList);
		
		return "/manager/memberManager";
	}
	
	

	
	
	// 관리자페이지 회원별 게시글 목록 연결
	@GetMapping("/memberBoard")
	public String memberBoardList() {
		
		
		
		
		
		return "/manager/memberBoard";
	}
	
	
	
	// 1:1문의 관리자페이지 연결
	@GetMapping("/askManager")
	public String askManager(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			, Model model
			) {
		
		// 1:1문의정보 불러오기
		Map<String, Object> map = service.selectAskList(cp);
		
		model.addAttribute("map", map);
		
		
		return "/manager/askManager";
	}
	
	
	
	
	
	
	// 신고관리 관리자페이지 연결
	@GetMapping("/reportManager")
	public String reportManager(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			, Model model
			) {
		
		// 신고 목록 불러오기
		Map<String, Object> map = service.selectReportList(cp);
		
		model.addAttribute("map", map);
		
		return "/manager/reportManager";
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
}

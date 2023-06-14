package edu.kh.justgo.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	

	
	
	// 1:1문의 관리자페이지 연결
	@GetMapping("/askManager")
	public String askManager() {
		return "/manager/askManager";
	}
	
	
	
	
	
	
	// 신고관리 관리자페이지 연결
	@GetMapping("/reportManager")
	public String reportManager() {
		return "/manager/reportManager";
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
}

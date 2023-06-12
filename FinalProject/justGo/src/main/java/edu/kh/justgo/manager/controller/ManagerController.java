package edu.kh.justgo.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.justgo.manager.model.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private ManagerService service;
	
	// 회원관리 관리자페이지 연결
	@GetMapping("/memberManager")
	public String memberManager() {
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

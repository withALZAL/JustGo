package edu.kh.justgo.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.justgo.myPage.model.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	// 마이페이지
	@GetMapping("/info")
	public String info() {
		return "/account/myPage";
	}
	
	// 개인정보수정
	@GetMapping("/updateInfo")
	public String updateInfo() {
		return "/account/updateInfo";
	}
}
package edu.kh.justgo.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.member.model.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@PostMapping
	public String login(String memberEmail, String memberPw,
			Model model, HttpServletResponse resp ,RedirectAttributes ra
			,@RequestHeader(value = "referer") String referer) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPw", memberPw);
		Member loginMember = service.login(map);
		
		String path = "redirect:";
		
		if(loginMember != null) {
			path += "/";
			model.addAttribute("loginMember", loginMember); // 로그인 유저 정보
		}else {
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해 주세요.");
			
		}
		
		return null;
	}
	

}
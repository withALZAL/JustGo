package edu.kh.justgo.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.member.model.service.MemberService;

@SessionAttributes({ "loginMember" })
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지로 이동
	@GetMapping("/account/login")
	public String login() {
		return "/account/login";
	}
	
	// 로그인
	@PostMapping("/account/login")
	public String login(
			String memberEmail, String memberPw,
			Model model, HttpServletResponse resp,
			RedirectAttributes ra, @RequestHeader(value = "referer") String referer) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPw", memberPw);
		Member loginMember = service.login(map);
		
		String path = "redirect:";
		
		if(loginMember != null) {
			path += "/";
			model.addAttribute("loginMember", loginMember); // 로그인 유저 정보
			
			Cookie cookie = new Cookie("map", loginMember.getMemberEmail());
			if(loginMember != null) {
				cookie.setMaxAge(60*60*24*30);
			} 
			cookie.setPath("/");
			resp.addCookie(cookie);
			
		}else {
			path += referer;
			ra.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해주세요.");
			
		}
		
		return path;
	}
	
	// 로그아웃
	@GetMapping("/account/logout")
	public String logout(RedirectAttributes ra, SessionStatus status, HttpSession session) {
		
		status.setComplete();

		ra.addFlashAttribute("message", "로그아웃되었습니다.");
		
		return "redirect:/";
	}
	
	
	// 회원 가입 페이지 이동
	@GetMapping("/account/join")
	public String join() {
		return "/account/join";
	}
	
	// 회원 가입 진행
	@PostMapping("/account/join")
	public String joinUp(Member inputMember, RedirectAttributes ra) {
		
		int result = service.joinUp(inputMember);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "/";
		    message = inputMember.getMemberNickname() + "님의 가입을 환영합니다.";
		    
	} else {
		path += "join";
		message = "회원 가입에 실패하셨습니다.";
	}
        ra.addFlashAttribute("message", message);
		return path;
	
	}

}

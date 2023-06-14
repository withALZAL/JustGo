package edu.kh.justgo.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.service.MyPageService;

@SessionAttributes({"loginMember"}) 
@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 마이 페이지 이동
	@GetMapping("/info")
	public String info() {
		return "/account/myPage";
		
		
	}
	
	// 개인정보수정 화면 들어가기
	@GetMapping("/updateInfo")
	public String updateinfo1() {
		return "/account/updateInfo";
	}
	
	
	// 개인정보수정
	@PostMapping("/updateInfo")
	public String updateInfo(
		   String currentPw,
		   String newPw,
		   String memberNickname,
		   Member updateMember,
    	  @SessionAttribute("loginMember") Member loginMember
    	 , RedirectAttributes ra) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.updateInfo(currentPw, newPw, memberNickname, memberNo);
		
    	String message = null;
    	
    	if(result > 0) {
    		message = "회원 정보가 수정되었습니다.";
    		loginMember.setMemberNickname( updateMember.getMemberNickname() );
    	} else {
    		message = "회원 정보 수정 실패";

    	}
    	
    	ra.addFlashAttribute("message", message);
		return "redirect:info";
		
	}
	
}

	

/*
 * // 비밀번호 변경
 * 
 * // @PostMapping("/updateInfo") public String changePw( String currentPw,
 * String newPw ,
 * 
 * @SessionAttribute("loginMember") Member loginMember, RedirectAttributes ra) {
 * 
 * // 로그인한 회원 번호 int memberNo = loginMember.getMemberNo();
 * 
 * // 비밀번호 변경 서비스 호출 int result = service.changePw(currentPw, newPw, memberNo);
 * 
 * String path = "redirect:"; String message = null;
 * 
 * if(result > 0) { // 변경 성공 message = "비밀번호가 변경 되었습니다."; path += "info";
 * 
 * } else { // 변경 실패 message = "현재 비밀번호가 일치하지 않습니다."; path += "updateInfo"; }
 * 
 * ra.addFlashAttribute("message", message);
 * 
 * return path; }
 * 
 * 
 * }
 */
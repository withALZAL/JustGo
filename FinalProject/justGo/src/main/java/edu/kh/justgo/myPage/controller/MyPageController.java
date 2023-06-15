package edu.kh.justgo.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 마이페이지
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


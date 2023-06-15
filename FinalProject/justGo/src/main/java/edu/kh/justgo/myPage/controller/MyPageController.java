package edu.kh.justgo.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
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
	
	// 프로필 이미지 수정(상준)
	@PostMapping("/updateProfileImage")
	public String updateProfileImage(
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value="profileImage", required=false) MultipartFile profileImage,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) throws IllegalStateException, IOException {
		
		String webPath = "/resources/images/memberImage/"+loginMember.getMemberNo()+"/profile/";
		
		File checkFolder = new File(webPath);
		if (!checkFolder.exists()) {
		    checkFolder.mkdirs(); // 없는 폴더 미리 만들기 -> 강사님께 컨펌받기
		}
		
		
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.updateProfileImage(profileImage, webPath, filePath, loginMember);
		
		if(result > 0) { // 성공
			ra.addFlashAttribute("message", "프로필 이미지 변경에 성공했습니다.");
		} else { // 실패
			ra.addFlashAttribute("message", "프로필 이미지 변경에 실패했습니다.");
		}
		
		return "redirect:info";
	}
	
}


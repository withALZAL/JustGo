package edu.kh.justgo.myPage.controller;

import java.io.File;
import java.io.IOException;
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
	@GetMapping("/updateNickname")
	public String updateNickname() {
		return "/account/updateNickname";
	}
	
	// 개인정보수정 화면 들어가기
	@GetMapping("/updatePw")
	public String updateNickPw() {
		return "/account/updatePw";
	}
	
	
	// 비밀번호 변경
	@PostMapping("/updatePw")
	public String updateInfo(
		   String currentPw,
		   String newPw,
    	  @SessionAttribute("loginMember") Member loginMember
    	 , RedirectAttributes ra) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.updatePw(currentPw, newPw, memberNo);
		
    	String message = null;
    	
    	if(result > 0) {
    		message = "비밀번호가 변경 되었습니다.";
    	} else {
    		message = "비밀번호가 일치하지 않습니다";
    	}
    	
    	ra.addFlashAttribute("message", message);
		return "redirect:info";
	}
	
	
	// 닉네임 수정
	@PostMapping("/updateNickname")
	public String updateNickname(
			Member updateMember
		  ,	String currentPw
		  , String memberNickname
		  , @SessionAttribute("loginMember") Member loginMember
    	  , RedirectAttributes ra
			) {
		
		updateMember.setMemberNo( loginMember.getMemberNo() );
		
		int result = service.updateNickname(updateMember);
		
		String message = null;
		
    	if(result > 0) { // 성공
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
		String filePath = session.getServletContext().getRealPath(webPath);
		
		File checkFolder = new File(filePath);
		if (!checkFolder.exists()) checkFolder.mkdirs(); // 폴더가 없는 경우 만들기
		
		int result = service.updateProfileImage(profileImage, webPath, filePath, loginMember);
		
		if(result > 0) { // 성공
			ra.addFlashAttribute("message", "프로필 이미지 변경에 성공했습니다.");
		} else { // 실패
			ra.addFlashAttribute("message", "프로필 이미지 변경에 실패했습니다.");
		}
		
		return "redirect:info";
	}
	
}


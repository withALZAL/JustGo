package edu.kh.justgo.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.service.MyPageService;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({ "loginMember" })
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// 마이페이지-프로필
	@GetMapping("/info")
	public String info() {
		return "/account/myPage-profile";
	}
	
	// 마이페이지-비밀번호변경
	@GetMapping("/updatePw")
	public String updatePw() {
		return "/account/myPage-updatePw";
	}
	
	// 비밀번호 변경
	@PostMapping("/updatePw")
	public String updatePw(
		   String currentPw,
		   String newPw,
    	  @SessionAttribute("loginMember") Member loginMember
    	 , RedirectAttributes ra) {
		
		int memberNo = loginMember.getMemberNo();
		String path = "redirect:";
		
		int result = service.updatePw(currentPw, newPw, memberNo);
		
    	String message = null;
    	
    	if(result > 0) {
    		message = "비밀번호가 변경되었습니다.";
    		path += "info";
    	} else {
    		message = "비밀번호가 일치하지 않습니다";
    		path += "updatePw";
    	}
    	
    	ra.addFlashAttribute("message", message);
		return path;
	}
	
	
	// 닉네임 수정(상준 추가 수정)
	@PostMapping("/updateNickname")
	public String updateNickname(
			Member updateMember,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra
			) {
		
		updateMember.setMemberNo(loginMember.getMemberNo());
		
		int result = service.updateNickname(updateMember);
		
		String message = null;
		
    	if(result > 0) { // 성공
    		message = "닉네임이 수정되었습니다.";
    		loginMember.setMemberNickname( updateMember.getMemberNickname() );
     	} else { // 실패
     		message = "닉네임 수정에 실패했습니다.";
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
	

	// 마이페이지-내가쓴글(상준)
	@GetMapping("/myWriting")
	public String myPost(
			@SessionAttribute(value="loginMember", required=false) Member loginMember,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) {
		
		int memberNo = loginMember.getMemberNo();
		
		System.out.println(paramMap.get("key5"));
		System.out.println(paramMap.get("key5"));
		System.out.println(paramMap.get("key5"));
		System.out.println(paramMap.get("key5"));
		System.out.println(paramMap.get("key5"));
		System.out.println(paramMap.get("key5"));
		
		
		if (paramMap.get("key5") == null) { // 검색어 없을 때
			Map<String, Object> map = service.myPost(memberNo, cp);
			
			model.addAttribute("map", map);
		} else { // 검색어 있을 때
			
			paramMap.put("memberNo", memberNo);
			
			Map<String, Object> map = service.myPost(paramMap, cp); // 오버로딩
			
			model.addAttribute("map", map);
		}
		
		return "/account/myPage-myWriting";
	}
	
}


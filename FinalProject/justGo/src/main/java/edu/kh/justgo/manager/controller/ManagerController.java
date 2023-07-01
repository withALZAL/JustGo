package edu.kh.justgo.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.service.ManagerService;
import edu.kh.justgo.member.model.dto.Member;

@Controller
@RequestMapping("/manager")
@SessionAttributes({ "loginMember" })
public class ManagerController {

	@Autowired
	private ManagerService service;

	// 회원관리 관리자페이지 연결
	@GetMapping("/memberManager")
	public String selectMemberList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model,
			@RequestParam Map<String, Object> paramMap) {

		// 회원정보 불러오기
		
		if (paramMap.get("boardSelect") == null) {
			
		Map<String, Object> map = service.selectMemberList(cp);

		model.addAttribute("map", map);
		}else {

			Map<String, Object> map = service.selectMemberList(paramMap, cp); // 오버로딩

			model.addAttribute("map", map);
		}

		
		// 콘솔에서 확인
//		System.out.println(memberList);

		return "/manager/memberManager";
	}

	// 관리자페이지 회원별 게시글 목록 연결
	@GetMapping("/memberBoard/{memberNo}")
	public String memberBoardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@PathVariable("memberNo") int memberNo) {

//        System.out.println("memberNo: " + memberNo);

		// 회원별 글 목록 불러오기
		Map<String, Object> map = service.selectMemberPostList(memberNo, cp);
		model.addAttribute("map", map);

		// 콘솔에서 확인
//        System.out.println("model" +model);

		return "/manager/memberBoard";
	}

	// 1:1문의 관리자페이지 연결
	@GetMapping("/askManager")
	public String askManager(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap) {

		
		if (paramMap.get("boardSelect2") == null) {
			
			Map<String, Object> map = service.selectAskList(cp);

			model.addAttribute("map", map);
		}else {

			Map<String, Object> map = service.selectAskList(paramMap, cp); // 오버로딩

			model.addAttribute("map", map);
		}

		return "/manager/askManager";
	}

	// 1:1문의 상세페이지 연결(회원문의 + 관리자 답변)
	@GetMapping("/askManager_detail/{feedbackNo}")
	public String askManagerDetail(@PathVariable("feedbackNo") int feedbackNo, Model model) {

//    	System.out.println("feedbackNo: " + feedbackNo);

		// 1:1문의 상세글 불러오기(회원문의글)
		Feedback memberAskList = service.selectMemberAskList(feedbackNo);
		Feedback managerAnswerList = service.selectManagerAnswerList(feedbackNo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberAskList", memberAskList);
		map.put("managerAnswerList", managerAnswerList);

//        System.out.println(map);

		model.addAttribute("map", map);
		// 콘솔에서 확인
//        System.out.println("model" +model);

		return "/manager/askManager_detail";
	}
	

	
	
	

	// 신고관리 관리자페이지 연결
	@GetMapping("/reportManager")
	public String reportManager(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model
								, @RequestParam Map<String, Object> paramMap
								) {

		if(paramMap.get("boardSelect3") == null) {
			
			// 신고 목록 불러오기
			Map<String, Object> map = service.selectReportList(cp);
	
			model.addAttribute("map", map);
		}else {
			Map<String, Object> map = service.selectReportList(paramMap, cp);
			
			model.addAttribute("map", map);
			
		}
		return "/manager/reportManager";
	}
	
	
	
	//관리자에서 게시글 삭제
	@GetMapping(value = "/nobtn")
	@ResponseBody
	public int deletePost(int boardNo) {
		return service.deletePost(boardNo);
	}

	
	//관리자에서 게시글 복원
	@GetMapping(value = "/rebtn")
	@ResponseBody
	public int restorePost(int boardNo) {
		return service.restorePost(boardNo);
	}
	
	
	//회원 프로필페이지 이동
	@GetMapping("/memberPage/{memberNo}")
	public String memberProfile(
				Member member
			, @PathVariable("memberNo") int memberNo
			, Model model
			) {
		
		Member memberP = service.memberProfile(memberNo);
		
		model.addAttribute("memberP", memberP); 
		
		
		return "/manager/memberPage";
	}


 	//회원 강제탈퇴	
    @GetMapping(value = "/deleteMemberBtn")
    @ResponseBody
	public int deleteMember(int memberNo) {
		return service.deleteMember(memberNo);
	}
    
    
    //탈퇴회원 복구 
    @GetMapping(value = "/restoreMemberBtn")
    @ResponseBody
    public int restoreMember(int memberNo) {
    	return service.restoreMember(memberNo);
    }
    
    // 관리자 신고 처리
    @GetMapping(value = "/conbtn")
    @ResponseBody
    public int reportConfirm(int reportNo, 
    		 @SessionAttribute("loginMember") Member loginMember) {
    	
    	
    	return service.reportConfirm(reportNo, loginMember);
    }
	
	
	
}

package edu.kh.justgo.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
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
			Model model) {

		// 회원정보 불러오기
		Map<String, Object> map = service.selectMemberList(cp);

		model.addAttribute("map", map);

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
	public String askManager(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		// 1:1문의정보 불러오기
		Map<String, Object> map = service.selectAskList(cp);

		model.addAttribute("map", map);

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
	
	/*
	
	
    // 회원의 게시글 삭제
    @PostMapping("/managerPostDelete")
    public String deletePost(
    		@RequestBody Board board
    		, @PathVariable("memberNo") int memberNo
    		, RedirectAttributes ra
			) throws IllegalStateException, IOException{
    	
    	board.setBoardNo(board.getBoardNo());
    	board.setMemberNo(board.getMemberNo());
    	
    	int result = service.deletePost(board);
    	
    	System.out.println(result);
    	
    	String message = null;
    	
    	
    	
    	if(result>0) {
    		message += "게시판이 삭제되었습니다.";
    	}else {
    		message += "게시판 삭제 실패..";
    	}
    	ra.addFlashAttribute("message", message);
    	return "/memberBoard" ;
    }
	
	
	
	
	

 	//회원 강제탈퇴	
    @GetMapping("/manager/memberBoard/{memberNo}/delete")
	public String deleteMember() {
		
		
		return null;
	}
	
	
	
*/	
	
	
	/* 삭제예정

	// 신고관리 관리자페이지 연결
	@GetMapping("/reportManager")
	public String reportManager(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		// 신고 목록 불러오기
		Map<String, Object> map = service.selectReportList(cp);

		model.addAttribute("map", map);

		return "/manager/reportManager";
	}
	*/

}

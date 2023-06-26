package edu.kh.justgo.board.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.service.AskService;
import edu.kh.justgo.board.model.service.BoardService;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.member.model.dto.Member;

@RequestMapping("/ask")
@SessionAttributes({ "loginMember" })
@Controller
public class AskController {
	
	@Autowired
	public AskService service1;
	
	@Autowired
	public BoardService service;
	
	
	
	// 1:1문의 연결
		@GetMapping("/boardAsk/{memberNo}")
		public String writingQuestion(
				@RequestParam(value="cp", required=false, defaultValue="1") int cp
				, Member loginMember
				, Model model
				) {
			
			int memberNo = loginMember.getMemberNo();
			
			// 1:1문의정보 불러오기
			Map<String, Object> map = service.selectAskList(cp, memberNo);
			
			model.addAttribute("map", map);
			
			return "/ask/boardAsk";
		}
		
		
		// 1:1문의 상세페이지 연결(회원문의 + 관리자 답변)
	    @GetMapping("/boardAsk_detail/{feedbackNo}")
	    public String askManagerDetail(
	    		@PathVariable("feedbackNo") int feedbackNo
	    		, Model model
	    		) {
	    	
//	    	System.out.println("feedbackNo: " + feedbackNo);
	    	
	    	// 1:1문의 상세글 불러오기(회원문의글)
	    	Feedback memberAskList = service.selectMemberAskList(feedbackNo);
	        Feedback managerAnswerList = service.selectManagerAnswerList(feedbackNo);
	    	
	        Map<String, Object> map = new HashMap<String, Object>();
	        
	        map.put("memberAskList", memberAskList);
	        
	        map.put("managerAnswerList", managerAnswerList);
	        
//	        System.out.println(map);
	        
	    	model.addAttribute("map", map);
	    	// 콘솔에서 확인
//	        System.out.println("model" +model);
	    	
	    	
	    	return "/ask/boardAsk_detail";
	    }
	
	// 로그인한 회원의 1:1문의
	@PostMapping("/write")
	public String insertAsk(
			Feedback feedback
			, @SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session
			) throws IllegalStateException, IOException{
		
		// 로그인한 회원 번호를 얻어와 feedback에 세팅
		feedback.setMemberNo(loginMember.getMemberNo());
		
//		System.out.println(feedback);
		
		int result = service1.insertAsk(feedback);

		
		String message = null;
		String path = "redirect:/";
		
		
		if (result > 0) { // 성공 시
			int feedbackNo = feedback.getFeedbackNo();
			
			message = "1:1문의 등록 성공";
			path += "ask/boardAsk_detail/" + feedbackNo;

		} else {
			message = "1:1문의 등록 실패.......";
			path += "ask/writingAsk"; // 게시글 쓰는 화면
		}

		ra.addFlashAttribute("message", message);

		System.out.println(path);

		
		 
		return path;
	}

}

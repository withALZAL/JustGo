package edu.kh.justgo.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
	
	// 운영관리 관리자페이지 연결
	@GetMapping("/manager")
	public String managerMemberList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model,
			@RequestParam Map<String, Object> paramMap) {
		
		// 회원정보 불러오기
		
		if (paramMap.get("boardSelect") == null) {
			
			Map<String, Object> map = service.managerMemberList(cp);
			
			model.addAttribute("map", map);
		}else {
			
			Map<String, Object> map = service.managerMemberList(paramMap, cp); // 오버로딩
			
			model.addAttribute("map", map);
		}

	
		// 콘솔에서 확인
//		System.out.println(memberList);

		return "/manager/manager";
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
	
	
    //관리자 대시보드 연결
    @GetMapping("/managerDashboard")
    public String managerDashboard(
    		Model model
    		) {

    	// 대시보드1
    	int countAllMember = service.countAllMember();
    	int countAllManager = service.countAllManager();
    	int countOutMember = service.countOutMember();
    	int countAllPost = service.countAllPost();
        model.addAttribute("countAllMember", countAllMember);
        model.addAttribute("countAllManager", countAllManager);
        model.addAttribute("countOutMember", countOutMember);
        model.addAttribute("countAllPost", countAllPost);
        
        // 대시보드2
        int countFree = service.countFree();
        int countQuestion = service.countQuestion();
        int countChina = service.countChina();
        int countJapan = service.countJapan();
        int countVietnam = service.countVietnam();
        int countThai = service.countThai();
        int countAustralia = service.countAustralia();
        model.addAttribute("countFree", countFree);
        model.addAttribute("countQuestion", countQuestion);
        model.addAttribute("countChina", countChina);
        model.addAttribute("countJapan", countJapan);
        model.addAttribute("countVietnam", countVietnam);
        model.addAttribute("countThai", countThai);
        model.addAttribute("countAustralia", countAustralia);
        
    	// 대시보드3
        int countTag1 = service.countTag1();
        int countTag2 = service.countTag2();
        int countTag3 = service.countTag3();
        int countTag4 = service.countTag4();
        model.addAttribute("countTag1", countTag1);
        model.addAttribute("countTag2", countTag2);
        model.addAttribute("countTag3", countTag3);
        model.addAttribute("countTag4", countTag4);
        
        // 대시보드4
//        int countMember6monthsAgo = service.countMember6monthsAgo(); // x개월 전 회원 수
//        int countMember3monthsAgo = service.countMember3monthsAgo();
//        int countMember2monthsAgo = service.countMember2monthsAgo();
//        int countMember1monthsAgo = service.countMember1monthsAgo();
//        int countMember2weeksAgo = service.countMember2weeksAgo();
//        int countMember1weeksAgo = service.countMember1weeksAgo();
//        int countMemberToday = service.countMemberToday();
//        int countPost6monthsAgo = service.countPost6monthsAgo(); // x개월 전 게시글 수
//        int countPost3monthsAgo = service.countPost3monthsAgo();
//        int countPost2monthsAgo = service.countPost2monthsAgo();
//        int countPost1monthsAgo = service.countPost1monthsAgo();
//        int countPost2weeksAgo = service.countPost2weeksAgo();
//        int countPost1weeksAgo = service.countPost1weeksAgo();
//        int countPostToday = service.countPostToday();
//        int countOut6monthsAgo = service.countOut6monthsAgo(); // x개월 전 탈퇴회원 수
//        int countOut3monthsAgo = service.countOut3monthsAgo();
//        int countOut2monthsAgo = service.countOut2monthsAgo();
//        int countOut1monthsAgo = service.countOut1monthsAgo();
//        int countOut2weeksAgo = service.countOut2weeksAgo();
//        int countOut1weeksAgo = service.countOut1weeksAgo();
//        int countOutToday = service.countOutToday();
//        int countReport6monthsAgo = service.countReport6monthsAgo(); // x개월 전 신고 수
//        int countReport3monthsAgo = service.countReport3monthsAgo();
//        int countReport2monthsAgo = service.countReport2monthsAgo();
//        int countReport1monthsAgo = service.countReport1monthsAgo();
//        int countReport2weeksAgo = service.countReport2weeksAgo();
//        int countReport1weeksAgo = service.countReport1weeksAgo();
//        int countReportToday = service.countReportToday();
//        model.addAttribute("g1m0", countMemberToday); // x개월 전 회원 수
//        model.addAttribute("g1m1", countMember1weeksAgo);
//        model.addAttribute("g1m2", countMember2weeksAgo);
//        model.addAttribute("g1m3", countMember1monthsAgo);
//        model.addAttribute("g1m4", countMember2monthsAgo);
//        model.addAttribute("g1m5", countMember3monthsAgo);
//        model.addAttribute("g1m6", countMember6monthsAgo);
//        model.addAttribute("g2m0", countPostToday); // x개월 전 게시글 수
//        model.addAttribute("g2m1", countPost1weeksAgo);
//        model.addAttribute("g2m2", countPost2weeksAgo);
//        model.addAttribute("g2m3", countPost1monthsAgo);
//        model.addAttribute("g2m4", countPost2monthsAgo);
//        model.addAttribute("g2m5", countPost3monthsAgo);
//        model.addAttribute("g2m6", countPost6monthsAgo);
//        model.addAttribute("g3m0", countOutToday); // x개월 전 탈퇴회원 수
//        model.addAttribute("g3m1", countOut1weeksAgo);
//        model.addAttribute("g3m2", countOut2weeksAgo);
//        model.addAttribute("g3m3", countOut1monthsAgo);
//        model.addAttribute("g3m4", countOut2monthsAgo);
//        model.addAttribute("g3m5", countOut3monthsAgo);
//        model.addAttribute("g3m6", countOut6monthsAgo);
//        model.addAttribute("g4m0", countReportToday); // x개월 전 신고 수
//        model.addAttribute("g4m1", countReport1weeksAgo);
//        model.addAttribute("g4m2", countReport2weeksAgo);
//        model.addAttribute("g4m3", countReport1monthsAgo);
//        model.addAttribute("g4m4", countReport2monthsAgo);
//        model.addAttribute("g4m5", countReport3monthsAgo);
//        model.addAttribute("g4m6", countReport6monthsAgo);
        
        
        // 대시보드5
        int report1 = service.report1(); // 욕설
        int report2 = service.report2(); // 차별적표헌
        int report3 = service.report3(); // 사칭
        int report4 = service.report4(); // 광고성, 도배글
        int report5 = service.report5(); // 선정성
        int report6 = service.report6(); // 불법정보포함
        int report7 = service.report7(); // 개인정보 노출
        int report8 = service.report8(); // 기타
        model.addAttribute("report1", report1);
        model.addAttribute("report2", report2);
        model.addAttribute("report3", report3);
        model.addAttribute("report4", report4);
        model.addAttribute("report5", report5);
        model.addAttribute("report6", report6);
        model.addAttribute("report7", report7);
        model.addAttribute("report8", report8);
    	
    	return "/manager/managerDashboard";
    }
}

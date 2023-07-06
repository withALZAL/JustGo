package edu.kh.justgo.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.manager.model.service.DashboardService;

@Controller
@RequestMapping("/manager")
@SessionAttributes({ "loginMember" })
public class DashboardController {
	
	@Autowired
	public DashboardService service;

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

package edu.kh.justgo.manager.controller;

import java.util.ArrayList;
import java.util.List;

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
    	
    	int[] dashboard1 = {countAllMember, countAllManager, countOutMember, countAllPost};
		model.addAttribute("dashboard1", dashboard1);
        
        // 대시보드2
        int countFree = service.countFree();
        int countQuestion = service.countQuestion();
        int countChina = service.countChina();
        int countJapan = service.countJapan();
        int countVietnam = service.countVietnam();
        int countThai = service.countThai();
        int countAustralia = service.countAustralia();
        
        int[] dashboard2 = {countFree, countQuestion, countChina, countJapan, countVietnam, countThai, countAustralia};
		model.addAttribute("dashboard2", dashboard2);
        
    	// 대시보드3
        int countTag1 = service.countTag1();
        int countTag2 = service.countTag2();
        int countTag3 = service.countTag3();
        int countTag4 = service.countTag4();
        
        int[] dashboard3 = {countTag1, countTag2, countTag3, countTag4};
		model.addAttribute("dashboard3", dashboard3);
		
		// 대시보드4
//		int[] dashboard4a = service.dashboard4a();
//		int[] dashboard4b = service.dashboard4b();
//		int[] dashboard4c = service.dashboard4c();
//		int[] dashboard4d = service.dashboard4d();
//		
//		int[][] dashboard4 = {dashboard4a, dashboard4b, dashboard4c, dashboard4d};
//		model.addAttribute("dashboard4", dashboard4);
        
        // 대시보드5
        int report1 = service.report1(); // 욕설
        int report2 = service.report2(); // 차별적표헌
        int report3 = service.report3(); // 사칭
        int report4 = service.report4(); // 광고성, 도배글
        int report5 = service.report5(); // 선정성
        int report6 = service.report6(); // 불법정보포함
        int report7 = service.report7(); // 개인정보 노출
        int report8 = service.report8(); // 기타
        
        int[] dashboard5 = {report1, report2, report3, report4, report5, report6, report7, report8};
		model.addAttribute("dashboard5", dashboard5);
		
    	return "/manager/managerDashboard";
    }
    
    // 대시보드6 팝업창
    @GetMapping("/chartDetail")
    public String chartDetail(
    		Model model
    		) {
    	
//    	int[] dashboard6China = service.dashboard6China();
//    	int[] dashboard6Japan = service.dashboard6Japan();
//    	int[] dashboard6Vietnam = service.dashboard6Vietnam();
//    	int[] dashboard6Thai = service.dashboard6Thai();
//    	int[] dashboard6Australia = service.dashboard6Australia();
//    	
//		int[][] dashboard6 = {dashboard6China, dashboard6Japan, dashboard6Vietnam, dashboard6Thai, dashboard6Australia};
//		model.addAttribute("dashboard6", dashboard6);
    	
    	return "manager/managerChartDetail";
    }
	
}

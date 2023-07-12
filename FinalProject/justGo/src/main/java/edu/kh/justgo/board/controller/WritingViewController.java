package edu.kh.justgo.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.justgo.myPage.model.service.MyPageService;

@Controller
public class WritingViewController {

	@Autowired
	private MyPageService service; // MyPageService 사용

	// 팝업창에 페이지네이션 던지기
	@GetMapping("/writingView")
	public String writingView(
			@RequestParam("replyMemberNo") int memberNo,
			@RequestParam("replyMemberNickname") String memberNickname,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) {
		
		Map<String, Object> map = service.myPost(memberNo, cp);
		map.put("memberNo", memberNo);
		map.put("cp", cp);
		model.addAttribute("map", map);
		model.addAttribute("memberNickname", memberNickname);
		
		
		return "writing/writingView";
	}
}

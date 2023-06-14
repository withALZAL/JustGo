package edu.kh.justgo.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@Controller
public class MoneyAPI {
	
	// 환율 계산기 실험(상준)
	@GetMapping("/api/money")
	public String moneyAPI() {
		return null;
	}
	
	// 날씨 검색기 실험(상준)
	@GetMapping("/api/weather")
	public String weatherAPI() {
		return null;
	}

}

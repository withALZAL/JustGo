package edu.kh.justgo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.kh.justgo.member.model.service.AjaxService;

@Controller
public class AjaxController {

	   @Autowired // DI
	   private AjaxService service;
	   
	   
	   // 이메일 중복 검사
	   @GetMapping("/dupCheck/email") 
	   @ResponseBody 
	   public int CheckEmail(String email) {
		   return service.checkEmail(email);
	   }
	   
	   // 닉네임 중복 검사
	   @GetMapping("/dupCheck/nickname") 
	   @ResponseBody
	   public int CheckNickname(String nickname) {
		   return service.checkNickname(nickname);
	   }
	   
	      
	   // 비밀번호 중복 검사
	   @PostMapping("/dupCheck/password")
	   @ResponseBody
	   public int checkPassword(
		   @RequestParam(value = "password") String password,
		   @RequestParam(value = "memberNo", defaultValue="0") int memberNo) {
		   
		   System.out.println(password);
		   System.out.println(memberNo);
		   
	       return service.checkPassword(password, memberNo);
	   }
	   
}

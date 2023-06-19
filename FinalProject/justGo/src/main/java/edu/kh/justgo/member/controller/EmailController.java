package edu.kh.justgo.member.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import edu.kh.justgo.member.model.service.EmailService;

@Controller
@SessionAttributes("authKey")
public class EmailController {
    
    @Autowired
    private EmailService service;
    
    
    // 회원가입 이메일 인증
    @GetMapping("/sendEmail/join")
    @ResponseBody
    public int joinUp(String email, String title) {

        return service.joinUp(email, "회원 가입");   

    }
    
    // 비밀번호 찾기 이메일 인증
    @GetMapping("/sendEmail/password")
    @ResponseBody
    public int passwordUp(String email, String title) {
        return service.passwordUp(email, "비밀번호 찾기");   
    }
    
    // 새 비밀번호 설정
    @PostMapping("/account/pwConfirm")
    public String pwConfirm(
    		String memberEmail,
    		String newPw, 
     	    RedirectAttributes ra) {
    	
    	
    	int result = service.pwConfirm(newPw, memberEmail);
  
    	String message = null;
    	
    	if(result > 0) {
    		message = "비밀번호가 변경되었습니다";
    	} else {
    		message = "비밀번호 변경 실패";
    	}
    	
    	ra.addFlashAttribute("message", message);
    	return "redirect:login";
    
    }
    
	// 비밀번호 변경 페이지로 이동
	@GetMapping("/account/pwConfirm")
	public String login() {
		return "/account/pwConfirm";
	}
    
    // 인증 체크하는 코드
    @GetMapping("/sendEmail/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(@RequestParam Map<String, Object> paramMap){
        return service.checkAuthKey(paramMap);
        }
    
    
    }


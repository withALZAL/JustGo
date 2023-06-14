package edu.kh.justgo.member.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import edu.kh.justgo.member.model.service.EmailService;

@Controller
@SessionAttributes("authKey")
public class EmailController {
    
    @Autowired
    private EmailService service;
    
    
    // 이메일 인증
    @GetMapping("/sendEmail/join")
    @ResponseBody
    public int joinUp(String email, String title) {

    
        return service.joinUp(email, "회원 가입");   
    }
    
    
    // 인증 체크하는 코드
    @GetMapping("/sendEmail/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(@RequestParam Map<String, Object> paramMap){
     
    	System.out.println(paramMap);
    	
        return service.checkAuthKey(paramMap);
    }
}

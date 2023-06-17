package edu.kh.justgo.member.model.service;

import java.util.Map;

public interface EmailService {

	int joinUp(String email, String title);
    
	String createAuthKey();
	
	int passwordUp(String email, String title);
	
	int checkAuthKey(Map<String, Object> paramMap);

	int pwConfirm(String newPw);


}

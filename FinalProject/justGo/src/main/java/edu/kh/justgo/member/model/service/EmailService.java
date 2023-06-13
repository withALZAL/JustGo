package edu.kh.justgo.member.model.service;

import java.util.Map;

public interface EmailService {

	int joinUp(String email, String title);
    
	String createAuthKey();
	
	int checkAuthKey(Map<String, Object> paramMap);

}

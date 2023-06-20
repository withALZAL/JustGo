package edu.kh.justgo.member.model.service;

import java.util.Map;

public interface EmailService {

	// 회원가입 이메일 인증 보내기
	int joinUp(String email, String title);
    
	// 인증키 생성
	String createAuthKey();
	
	// 비밀번호 찾기 이메일 인증 보내기
	int passwordUp(String email, String title);
	
	// 인증 확인
	int checkAuthKey(Map<String, Object> paramMap);

	// 인증 완료된 이메일 비밀번호 변경
	int pwConfirm(String memberEmail, String newPw);


}

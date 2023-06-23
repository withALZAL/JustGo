package edu.kh.justgo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.justgo.member.model.dao.AjaxDAO;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.dao.MyPageDAO;

@Service
public class AjaxServiceImpl implements AjaxService{

	@Autowired
	private AjaxDAO dao;
	
	@Autowired
	private MyPageDAO daoTemp; // 현재 비밀번호 체크용
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	// 이메일 중복 검사
	@Override
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}

	// 닉네임 중복 검사
	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}

	// 현재 비밀번호 체크
//	@Override
//	public int checkPassword(
//			String password,
//			int memberNo
//			) {
//		
//		String encPw = daoTemp.selectEncPw(memberNo);
//		
//		int result = 0;
//
//		if(bcrypt.matches(password, encPw)) {
//			result = 1;
//		} else {
//			result = 0;
//		}
//		
//		return result;
//	}
	

}

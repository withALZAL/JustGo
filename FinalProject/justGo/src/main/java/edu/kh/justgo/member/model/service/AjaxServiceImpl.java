package edu.kh.justgo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kh.justgo.member.model.dao.AjaxDAO;

@Service
public class AjaxServiceImpl implements AjaxService{

	@Autowired
	private AjaxDAO dao;
	
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

}

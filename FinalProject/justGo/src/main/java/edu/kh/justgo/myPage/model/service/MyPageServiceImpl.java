package edu.kh.justgo.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	
	// 회원 정보 수정 
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateInfo(Member updateMember) {
		return dao.updateInfo(updateMember);
	}

	// 회원 정보 비밀번호 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePw(String currentPw, String newPw, int memberNo) {
	
		String encPw = dao.selectEncPw(memberNo);
		
		  if(bcrypt.matches(currentPw, encPw)) {
			  
		      return dao.changePw(bcrypt.encode(newPw) , memberNo);
	}
		  
     return 0;

}

}


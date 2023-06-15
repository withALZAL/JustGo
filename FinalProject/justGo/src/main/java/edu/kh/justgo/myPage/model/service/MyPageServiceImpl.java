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
	public int updateInfo(String currentPw, String newPw, String memberNickname, int memberNo) {
		String encPw = dao.selectEncPw(memberNo);
		
		int result = 0;
		if(bcrypt.matches(currentPw, encPw)) {
			
			 result = dao.changePw(bcrypt.encode(newPw) , memberNo);
		}
		
		if(result > 0) {
			Member member = new Member();
			
			member.setMemberNo(memberNo);
			member.setMemberNickname(memberNickname);
			return dao.updateInfo(member);
		}


		return 0;
	}
}
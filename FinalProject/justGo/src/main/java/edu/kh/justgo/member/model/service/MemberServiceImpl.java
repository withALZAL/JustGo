package edu.kh.justgo.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.member.model.dao.MemberDAO;
import edu.kh.justgo.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	// 로그인
	@Override
	public Member login(Map<String, Object> map) {
		
		Member loginMember = dao.login(map);
		
		if(loginMember != null) { 
			if(bcrypt.matches((String)map.get("memberPw"), loginMember.getMemberPw())){ 
				
				// 비밀번호를 유지하지 않기 위해서 로그인 정보에서 제거
				loginMember.setMemberPw(null); 
				
			}else { // 다를 경우
				loginMember = null; // 로그인 실패처럼 만듦
				
			}
		}
		return loginMember;
	}

    // 회원 가입 서비스
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int join(Member inputMember) {
		
		String encPw = bcrypt.encode(inputMember.getMemberPw());
		inputMember.setMemberPw(encPw);
		
	    int result = dao.join(inputMember);
		
	    return result;
	}

	// 회원탈퇴
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteAccount(String memberPw, int memberNo) {
		
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(memberPw, encPw)) {
			return dao.deleteAccount(memberNo); // 성공시 1 반환
		}
		return 0; // 실패시 0 반환
		
	}

	
	
}

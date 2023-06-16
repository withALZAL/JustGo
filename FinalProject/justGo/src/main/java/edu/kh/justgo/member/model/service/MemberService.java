package edu.kh.justgo.member.model.service;

import java.util.Map;

import edu.kh.justgo.member.model.dto.Member;

public interface MemberService {

	// 로그인
	Member login(Map<String, Object> map);

	// 회원가입
	int join(Member inputMember);
	
	// 회원탈퇴(비밀번호 체크)
	int deleteAccount(String memberPw, int memberNo);


}

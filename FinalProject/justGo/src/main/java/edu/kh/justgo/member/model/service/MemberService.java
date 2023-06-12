package edu.kh.justgo.member.model.service;

import java.util.Map;

import edu.kh.justgo.member.model.dto.Member;

public interface MemberService {

	// 로그인
	Member login(Map<String, Object> map);

}

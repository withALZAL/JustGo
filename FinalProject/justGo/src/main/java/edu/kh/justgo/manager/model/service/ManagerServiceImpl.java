package edu.kh.justgo.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.manager.model.dao.ManagerDAO;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.member.model.dto.Member;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAO dao;
	
	// 회원목록 조회
	@Override
	public Map<String, Object> selectMemberList(int cp) {
		
		int listCount = dao.getMemberListCount();
		
		System.out.println("listCount : " +listCount);
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Member> memberList = dao.selectMemberList(pagination);
		
		// pagination, memberList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("memberList", memberList);
		
		
//		System.out.println(map);
		
		
		return map;
	}
	
	
	// 1:1문의 목록조회
	@Override
	public Map<String, Object> selectAskList(int cp) {
		
		int askListCount = dao.getAskListCount();
		
		System.out.println("askListCount : " + askListCount);
		
		Pagination pagination = new Pagination(askListCount, cp);
		
		List<Feedback> askList = dao.selectAskList(pagination);
		
		// pagination, askList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("askList", askList);
		
		System.out.println(map);
		
		return map;
	}
	
}

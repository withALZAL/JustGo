package edu.kh.justgo.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dao.DashboardDAO;
import edu.kh.justgo.manager.model.dao.ManagerMainDAO;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;

@Service
public class ManagerMainServiceImpl implements ManagerMainService{
	
	@Autowired
	public ManagerMainDAO dao;
	
	// 오늘 가입자수, 신규글 수, 댓글 수
	@Override
	public Map<String, Integer> todaysCount() {
		return dao.todaysCount();
	}
	
	// 1:1문의 Count
	@Override
	public Map<String, Integer> feedbackCount() {
		return dao.feedbackCount();
	}
	
	// 신고 Count
	@Override
	public Map<String, Integer> reportCount() {
		return dao.reportCount();
	}
	
	// 최신글 List
	@Override
	public List<Board> newPost() {
		return dao.newPost();
	}
	
	// 신규문의 List
	@Override
	public List<Feedback> newFeedback() {
		return dao.newFeedback();
	}
	
}

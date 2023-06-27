package edu.kh.justgo.board.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dao.AskDAO;
import edu.kh.justgo.common.utility.Util;
import edu.kh.justgo.manager.model.dto.Feedback;

@Service
public class AskServiceImpl implements AskService{

	@Autowired
	public AskDAO dao;

	// 로그인한 회원의 1:1문의 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAsk(Feedback feedback) {
		// XSS 방지 처리
		feedback.setFeedbackTitle(Util.XSSHandling(feedback.getFeedbackTitle() ) );
		feedback.setFeedbackText(Util.XSSHandling(feedback.getFeedbackText() ) );
		
		
		int result = dao.insertAsk(feedback);
		return result;
	}
	
	

	// 로그인한 회원의 1:1문의 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteAsk(Feedback feedback) {
		return dao.deleteAsk(feedback);
	}
	
}

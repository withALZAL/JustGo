package edu.kh.justgo.alarm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.alarm.model.dao.AlarmDAO;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	public AlarmDAO dao;

	
	@Override
	public Member sendMember(String memberNo) {
		return dao.sendMember(memberNo);
	}
	
	
	
	@Override
	public Report sendReport(String boardNo) {
		return dao.sendReport(boardNo);
	}
	
	
	
	@Override
	public Feedback sendFeedback(String feedbackNo) {
		return dao.sendFeedback(feedbackNo);
	}
	
	
	
	
}

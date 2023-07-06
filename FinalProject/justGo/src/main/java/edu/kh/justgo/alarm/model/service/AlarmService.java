package edu.kh.justgo.alarm.model.service;

import org.springframework.ui.Model;

import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

public interface AlarmService {
	
	 
	Member sendMember(String memberNo);
//	Member MemberNickname(String memberNo);
//	Member ManagerNickname(String memberNo);
	
	Report sendReport(String boardNo);
//	Report boardTitle(String boardNo);
//	Report reportConfirm(String boardNo);
	
	Feedback sendFeedback(String feedbackNo);
//	Feedback feedbackTitle(String feedbackNo);
//	Feedback feedbackConfrim(String feedbackNo);
	

}

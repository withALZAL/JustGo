package edu.kh.justgo.alarm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;

@Repository
public class AlarmDAO {

	@Autowired
	public SqlSessionTemplate sql;

	public Member sendMember(String memberNo) {
		return sql.selectOne("alarmMapper.sendMember", memberNo);
	}

	public Report sendReport(String boardNo) {
		return sql.selectOne("alarmMapper.sendReport", boardNo);
	}

	public Feedback sendFeedback(String feedbackNo) {
		return sql.selectOne("alarmMapper.sendFeedback", feedbackNo);
	}
	
}

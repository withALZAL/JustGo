package edu.kh.justgo.board.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.justgo.board.model.dao.ReportDAO;
import edu.kh.justgo.manager.model.dto.Report;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	public ReportDAO dao;

	// 회원이 게시물 신고
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportBoard(Report report) {
		
		report.setReportCategory(report.getReportCategory());
		
		int result = dao.reportBoard(report);
		
//		System.out.println("result : " +result);
		
		return result;
	}
	
	
	// 로그인한 회원이 이미 신고한 게시물인지 확인
	@Override
	public int reportSelect(Report report) {
		return dao.reportSelect(report);
	}
	
	
}

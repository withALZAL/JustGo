package edu.kh.justgo.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.manager.model.dao.DashboardDAO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	public DashboardDAO dao;
	
	// 대시보드1
	@Override
	public int countAllMember() {return dao.countAllMember();}
	@Override
	public int countAllManager() {return dao.countAllManager();}
	@Override
	public int countOutMember() {return dao.countOutMember();}
	@Override
	public int countAllPost() {return dao.countAllPost();}
	
	// 대시보드2
	@Override
	public int countFree() {return dao.countFree();}
	@Override
	public int countQuestion() {return dao.countQuestion();}
	@Override
	public int countChina() {return dao.countChina();}
	@Override
	public int countJapan() {return dao.countJapan();}
	@Override
	public int countVietnam() {return dao.countVietnam();}
	@Override
	public int countThai() {return dao.countThai();}
	@Override
	public int countAustralia() {return dao.countAustralia();}

	// 대시보드3
	@Override
	public int countTag1() {return dao.countTag1();}
	@Override
	public int countTag2() {return dao.countTag2();}
	@Override
	public int countTag3() {return dao.countTag3();}
	@Override
	public int countTag4() {return dao.countTag4();}

	// 대시보드5
	@Override
	public int report1() {return dao.report1();}
	@Override
	public int report2() {return dao.report2();}
	@Override
	public int report3() {return dao.report3();}
	@Override
	public int report4() {return dao.report4();}
	@Override
	public int report5() {return dao.report5();}
	@Override
	public int report6() {return dao.report6();}
	@Override
	public int report7() {return dao.report7();}
	@Override
	public int report8() {return dao.report8();}

	// 대시보드4
//	@Override
//	public int countMember6monthsAgo() {return dao.countMember6monthsAgo();}
//	@Override
//	public int countMember3monthsAgo() {return dao.countMember3monthsAgo();}
//	@Override
//	public int countMember2monthsAgo() {return dao.countMember2monthsAgo();}
//	@Override
//	public int countMember1monthsAgo() {return dao.countMember1monthsAgo();}
//	@Override
//	public int countMember2weeksAgo() {return dao.countMember2weeksAgo();}
//	@Override
//	public int countMember1weeksAgo() {return dao.countMember1weeksAgo();}
//	@Override
//	public int countMemberToday() {return dao.countMemberToday();}
//	@Override
//	public int countPost6monthsAgo() {return dao.countPost6monthsAgo();}
//	@Override
//	public int countPost3monthsAgo() {return dao.countPost3monthsAgo();}
//	@Override
//	public int countPost2monthsAgo() {return dao.countPost2monthsAgo();}
//	@Override
//	public int countPost1monthsAgo() {return dao.countPost1monthsAgo();}
//	@Override
//	public int countPost2weeksAgo() {return dao.countPost2weeksAgo();}
//	@Override
//	public int countPost1weeksAgo() {return dao.countPost1weeksAgo();}
//	@Override
//	public int countPostToday() {return dao.countPostToday();}
//	@Override
//	public int countOut6monthsAgo() {return dao.countOut6monthsAgo();}
//	@Override
//	public int countOut3monthsAgo() {return dao.countOut3monthsAgo();}
//	@Override
//	public int countOut2monthsAgo() {return dao.countOut2monthsAgo();}
//	@Override
//	public int countOut1monthsAgo() {return dao.countOut1monthsAgo();}
//	@Override
//	public int countOut2weeksAgo() {return dao.countOut2weeksAgo();}
//	@Override
//	public int countOut1weeksAgo() {return dao.countOut1weeksAgo();}
//	@Override
//	public int countOutToday() {return dao.countOutToday();}
//	@Override
//	public int countReport6monthsAgo() {return dao.countReport6monthsAgo();}
//	@Override
//	public int countReport3monthsAgo() {return dao.countReport3monthsAgo();}
//	@Override
//	public int countReport2monthsAgo() {return dao.countReport2monthsAgo();}
//	@Override
//	public int countReport1monthsAgo() {return dao.countReport1monthsAgo();}
//	@Override
//	public int countReport2weeksAgo() {return dao.countReport2weeksAgo();}
//	@Override
//	public int countReport1weeksAgo() {return dao.countReport1weeksAgo();}
//	@Override
//	public int countReportToday() {return dao.countReportToday();}
}

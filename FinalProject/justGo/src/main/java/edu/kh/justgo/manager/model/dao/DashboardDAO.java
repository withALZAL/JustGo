package edu.kh.justgo.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAO {
	
	@Autowired
	public SqlSessionTemplate sql;
	
	/**
	 * 대시보드1
	 * @return
	 */
	public int countAllMember() {	return sql.selectOne("dashboardMapper.countAllMember");}
	public int countAllManager() {	return sql.selectOne("dashboardMapper.countAllManager");}
	public int countOutMember() {	return sql.selectOne("dashboardMapper.countOutMember");}
	public int countAllPost() {	return sql.selectOne("dashboardMapper.countAllPost");}
	
	/**
	 * 대시보드3
	 * @return
	 */
	public int countTag1() {	return sql.selectOne("dashboardMapper.countTag1");}
	public int countTag2() {	return sql.selectOne("dashboardMapper.countTag2");}
	public int countTag3() {	return sql.selectOne("dashboardMapper.countTag3");}
	public int countTag4() {	return sql.selectOne("dashboardMapper.countTag4");}

	/** 대시보드2
	 * @return
	 */
	public int countFree() {	return sql.selectOne("dashboardMapper.countFree");}
	public int countQuestion() {return sql.selectOne("dashboardMapper.countQuestion");}
	public int countChina() {	return sql.selectOne("dashboardMapper.countChina");}
	public int countJapan() {	return sql.selectOne("dashboardMapper.countJapan");}
	public int countVietnam() {	return sql.selectOne("dashboardMapper.countVietnam");}
	public int countThai() {	return sql.selectOne("dashboardMapper.countThai");}
	public int countAustralia(){return sql.selectOne("dashboardMapper.countAustralia");}
	
	/**
	 * 대시보드4
	 * @return
	 */
//	public int countMember6monthsAgo() {return sql.selectOne("dashboardMapper.countMember6monthsAgo");}
//	public int countMember3monthsAgo() {return sql.selectOne("dashboardMapper.countMember3monthsAgo");}
//	public int countMember2monthsAgo() {return sql.selectOne("dashboardMapper.countMember2monthsAgo");}
//	public int countMember1monthsAgo() {return sql.selectOne("dashboardMapper.countMember1monthsAgo");}
//	public int countMember2weeksAgo() {return sql.selectOne("dashboardMapper.countMember2weeksAgo");}
//	public int countMember1weeksAgo() {return sql.selectOne("dashboardMapper.countMember1weeksAgo");}
//	public int countMemberToday() {return sql.selectOne("dashboardMapper.countMemberToday");}
//	
//	public int countPost6monthsAgo() {return sql.selectOne("dashboardMapper.countPost6monthsAgo");}
//	public int countPost3monthsAgo() {return sql.selectOne("dashboardMapper.countPost3monthsAgo");}
//	public int countPost2monthsAgo() {return sql.selectOne("dashboardMapper.countPost2monthsAgo");}
//	public int countPost1monthsAgo() {return sql.selectOne("dashboardMapper.countPost1monthsAgo");}
//	public int countPost2weeksAgo() {return sql.selectOne("dashboardMapper.countPost2weeksAgo");}
//	public int countPost1weeksAgo() {return sql.selectOne("dashboardMapper.countPost1weeksAgo");}
//	public int countPostToday() {return sql.selectOne("dashboardMapper.countPostToday");}
//	
//	public int countOut6monthsAgo() {return sql.selectOne("dashboardMapper.countOut6monthsAgo");}
//	public int countOut3monthsAgo() {return sql.selectOne("dashboardMapper.countOut3monthsAgo");}
//	public int countOut2monthsAgo() {return sql.selectOne("dashboardMapper.countOut2monthsAgo");}
//	public int countOut1monthsAgo() {return sql.selectOne("dashboardMapper.countOut1monthsAgo");}
//	public int countOut2weeksAgo() {return sql.selectOne("dashboardMapper.countOut2weeksAgo");}
//	public int countOut1weeksAgo() {return sql.selectOne("dashboardMapper.countOut1weeksAgo");}
//	public int countOutToday() {return sql.selectOne("dashboardMapper.countOutToday");}
//	
//	public int countReport6monthsAgo() {return sql.selectOne("dashboardMapper.countReport6monthsAgo");}
//	public int countReport3monthsAgo() {return sql.selectOne("dashboardMapper.countReport3monthsAgo");}
//	public int countReport2monthsAgo() {return sql.selectOne("dashboardMapper.countReport2monthsAgo");}
//	public int countReport1monthsAgo() {return sql.selectOne("dashboardMapper.countReport1monthsAgo");}
//	public int countReport2weeksAgo() {return sql.selectOne("dashboardMapper.countReport2weeksAgo");}
//	public int countReport1weeksAgo() {return sql.selectOne("dashboardMapper.countReport1weeksAgo");}
//	public int countReportToday() {return sql.selectOne("dashboardMapper.countReportToday");}

	/**
	 * 대시보드5
	 * @return
	 */
	public int report1() {return sql.selectOne("dashboardMapper.report1");}
	public int report2() {return sql.selectOne("dashboardMapper.report2");}
	public int report3() {return sql.selectOne("dashboardMapper.report3");}
	public int report4() {return sql.selectOne("dashboardMapper.report4");}
	public int report5() {return sql.selectOne("dashboardMapper.report5");}
	public int report6() {return sql.selectOne("dashboardMapper.report6");}
	public int report7() {return sql.selectOne("dashboardMapper.report7");}
	public int report8() {return sql.selectOne("dashboardMapper.report8");}

}

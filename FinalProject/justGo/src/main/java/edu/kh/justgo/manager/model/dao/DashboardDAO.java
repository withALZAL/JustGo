package edu.kh.justgo.manager.model.dao;

import java.util.Map;

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
	public Map<String, Integer> dashboard4a() {return sql.selectOne("dashboardMapper.dashboard4a");}
	public Map<String, Integer> dashboard4b() {return sql.selectOne("dashboardMapper.dashboard4b");}
	public Map<String, Integer> dashboard4c() {return sql.selectOne("dashboardMapper.dashboard4c");}
	public Map<String, Integer> dashboard4d() {return sql.selectOne("dashboardMapper.dashboard4d");}

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
	
	/**
	 * 대시보드6
	 */
	public Map<String, Integer> dashboard6China() {return sql.selectOne("dashboardMapper.dashboard6China");}
	public Map<String, Integer> dashboard6Japan() {return sql.selectOne("dashboardMapper.dashboard6Japan");}
	public Map<String, Integer> dashboard6Vietnam() {return sql.selectOne("dashboardMapper.dashboard6Vietnam");}
	public Map<String, Integer> dashboard6Thai() {return sql.selectOne("dashboardMapper.dashboard6Thai");}
	public Map<String, Integer> dashboard6Australia() {return sql.selectOne("dashboardMapper.dashboard6Australia");}

}

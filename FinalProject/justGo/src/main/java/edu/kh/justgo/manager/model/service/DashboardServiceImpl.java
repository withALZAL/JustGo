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


	// 대시보드4
	@Override
	public int[] dashboard4a() {return dao.dashboard4a();}
	public int[] dashboard4b() {return dao.dashboard4b();}
	public int[] dashboard4c() {return dao.dashboard4c();}
	public int[] dashboard4d() {return dao.dashboard4d();}
	
	
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
}

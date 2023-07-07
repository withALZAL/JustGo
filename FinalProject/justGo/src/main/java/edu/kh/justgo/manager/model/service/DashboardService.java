package edu.kh.justgo.manager.model.service;

import java.util.Map;

public interface DashboardService {
	
	/**
	 * 대시보드1
	 * @return int
	 */
	int countAllMember();
	int countAllManager();
	int countOutMember();
	int countAllPost();
	
	/**
	 * 대시보드2
	 * @return int
	 */
	int countFree();
	int countQuestion();
	int countChina();
	int countJapan();
	int countVietnam();
	int countThai();
	int countAustralia();

	/**
	 * 대시보드3
	 * @return int
	 */
	int countTag1();
	int countTag2();
	int countTag3();
	int countTag4();

	/**
	 * 대시보드4
	 * @return
	 */
	Map<String, Integer> dashboard4a(); 
	Map<String, Integer> dashboard4b(); 
	Map<String, Integer> dashboard4c(); 
	Map<String, Integer> dashboard4d(); 
	
	/**
	 * 대시보드5
	 * @return int
	 */
	int report1();
	int report2();
	int report3();
	int report4();
	int report5();
	int report6();
	int report7();
	int report8();
	
	/**
	 * 대시보드6
	 * @return
	 */
	Map<String, Integer> dashboard6China();
	Map<String, Integer> dashboard6Japan();
	Map<String, Integer> dashboard6Vietnam();
	Map<String, Integer> dashboard6Thai();
	Map<String, Integer> dashboard6Australia();



}

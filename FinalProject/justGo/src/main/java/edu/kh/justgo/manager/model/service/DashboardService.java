package edu.kh.justgo.manager.model.service;

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
	 * @return int[]
	 */
	int[] dashboard4a(); 
	int[] dashboard4b(); 
	int[] dashboard4c(); 
	int[] dashboard4d(); 
	
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
	 * 대시보드4
	 * @return int
	 */
//	int countMember6monthsAgo();
//	int countMember3monthsAgo();
//	int countMember2monthsAgo();
//	int countMember1monthsAgo();
//	int countMember2weeksAgo();
//	int countMember1weeksAgo();
//	int countMemberToday();
//	int countPost6monthsAgo();
//	int countPost3monthsAgo();
//	int countPost2monthsAgo();
//	int countPost1monthsAgo();
//	int countPost2weeksAgo();
//	int countPost1weeksAgo();
//	int countPostToday();
//	int countOut6monthsAgo();
//	int countOut3monthsAgo();
//	int countOut2monthsAgo();
//	int countOut1monthsAgo();
//	int countOut2weeksAgo();
//	int countOut1weeksAgo();
//	int countOutToday();
//	int countReport6monthsAgo();
//	int countReport3monthsAgo();
//	int countReport2monthsAgo();
//	int countReport1monthsAgo();
//	int countReport2weeksAgo();
//	int countReport1weeksAgo();
//	int countReportToday();


	
//	/** 대시보드에 나타나는 회원수
//	 * @return
//	 */
//	int countAllMember();
//
//	
//	/** 대시보드에 나타나는 운영자수
//	 * @return
//	 */
//	int countAllManager();
//
//	
//	/** 대시보드에 나타나는 탈퇴회원 수
//	 * @return
//	 */
//	int countOutMember();
//
//	
//	/** 대시보드에 나타나는 게시글 수
//	 * @return
//	 */
//	int countAllPost();
//
//	/**
//	 * @return
//	 */
//	int countReportAbusive();
//
//	/**
//	 * @return
//	 */
//	int countReportDisparaging_expression();
//
//	/**
//	 * @return
//	 */
//	int countReportImpersonation();
//
//	/**
//	 * @return
//	 */
//	int countReportAdvertisement();
//
//	/**
//	 * @return
//	 */
//	int countReportSensationality();
//
//	/**
//	 * @return
//	 */
//	int countReportIllegal_information();
//
//	/**
//	 * @return
//	 */
//	int countReportPersonal();
//
//	/**
//	 * @return
//	 */
//	int countReportEtc();

}

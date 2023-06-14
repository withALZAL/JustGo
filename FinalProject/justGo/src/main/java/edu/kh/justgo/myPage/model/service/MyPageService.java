package edu.kh.justgo.myPage.model.service;



public interface MyPageService {

	/** 회원 정보 수정 서비스
	 * @param updateMember
	 * @return
	 */
	int updateInfo(String currentPw, String newPw, String memberNickname, int memberNo);

	/** 비밀번호 변경 서비스
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	 // int changePw(String currentPw, String newPw, int memberNo); 


}

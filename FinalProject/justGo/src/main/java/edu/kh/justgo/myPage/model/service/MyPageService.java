package edu.kh.justgo.myPage.model.service;

import edu.kh.justgo.member.model.dto.Member;

public interface MyPageService {

	/** 회원 정보 수정 서비스
	 * @param updateMember
	 * @return
	 */
	int updateInfo(Member updateMember);

	/** 비밀번호 변경 서비스
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	int changePw(String currentPw, String newPw, int memberNo);

}

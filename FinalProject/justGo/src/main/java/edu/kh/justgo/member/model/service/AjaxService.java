package edu.kh.justgo.member.model.service;

public interface AjaxService {

	/** 이메일 중복 화인
	 * @param email
	 * @return count
	 */
	public int checkEmail(String email);

	/** 닉네임 중복 확인
	 * @param nickname
	 * @return count
	 */
	public int checkNickname(String nickname);
}

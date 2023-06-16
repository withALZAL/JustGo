package edu.kh.justgo.myPage.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.justgo.member.model.dto.Member;

public interface MyPageService {

	/** 회원 정보 수정 서비스
	 * @param updateMember
	 * @return
	 */
	int updateInfo(String currentPw, String newPw, String memberNickname, int memberNo);

	/**
	 * 프로필 이미지 변경 서비스(상준)
	 * @param profileImage
	 * @param updateMember
	 * @return
	 */
	int updateProfileImage(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws IllegalStateException, IOException;

	/** 비밀번호 변경 서비스
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	 // int changePw(String currentPw, String newPw, int memberNo); 


}

package edu.kh.justgo.myPage.model.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import edu.kh.justgo.member.model.dto.Member;

public interface MyPageService {

	/** 비밀번호 변경 서비스
	 * @param updateMember
	 * @return
	 */
	int updatePw(String currentPw, String newPw, int memberNo);

	/**
	 * 프로필 이미지 변경 서비스(상준)
	 * @param profileImage
	 * @param updateMember
	 * @return
	 */
	int updateProfileImage(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws IllegalStateException, IOException;

	/** 닉네임 변경
	 * @param updateMember
	 * @return
	 */
	int updateNickname(Member updateMember);

	/**
	 * 내가 쓴 글
	 * @param memberNo
	 * @return
	 */
	Map<String, Object> myPost(int memberNo, int cp);




}

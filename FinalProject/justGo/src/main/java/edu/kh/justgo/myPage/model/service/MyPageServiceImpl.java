package edu.kh.justgo.myPage.model.service;

import java.io.File;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import edu.kh.justgo.common.utility.Util;
import edu.kh.justgo.member.model.dto.Member;
import edu.kh.justgo.myPage.model.dao.MyPageDAO;
import edu.kh.justgo.myPage.model.exception.FileUploadException;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	
	// 비밀번호 변경 
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updatePw(String currentPw, String newPw, int memberNo) {
		
		String encPw = dao.selectEncPw(memberNo);

		if(bcrypt.matches(currentPw, encPw)) {
			
			 return dao.changePw(bcrypt.encode(newPw) , memberNo);

	}
		return 0;	
	
	}
		
		
	// 프로필 이미지 변경(상준)
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateProfileImage(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws IllegalStateException, IOException {
		
		String rename = Util.fileRename(profileImage.getOriginalFilename());
		
		loginMember.setProfileImg(webPath+rename);
		
		int result = dao.updateProfileImage(loginMember);
		
		if(result > 0) { // 경로 삽입 성공
			
			profileImage.transferTo(new File(filePath+rename)); // File 안에는 절대경로만 작성해야 함
			
		} else { //경로 삽입 실패
			throw new FileUploadException();
		}
		
		return result;
	}
	
	
	// 닉네임 변경
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateNickname(Member updateMember) {
		return dao.updateNickname(updateMember);
	}

	

	
	
}
package edu.kh.justgo.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.dto.Pagination;
import edu.kh.justgo.board.model.dto.Pagination10;
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


	// 내가 쓴 글
	@Override
	public Map<String, Object> myPost(int memberNo, int cp) {
		
		int postCount = dao.postCount(memberNo);
		
			System.out.println("postCount:"+postCount); // 잘 담김
		
		Pagination10 pagination10 = new Pagination10(postCount, cp);
		
			System.out.println("pagination:"+pagination10); // 잘 담김
		
		List<Board> myPostList = dao.selectMyPostList(pagination10, memberNo); // Board의 5개 열 정보가 담긴 List 형태로 반환
		
		Map<String, Object> map = new HashMap<>(); // myPostList와 myPostPagination을 Map에 담아서 반환
		map.put("pagination", pagination10);
		map.put("myPostList", myPostList);
		
		System.out.println("map:      "+map);
		
		return map;
	}
	// 내가 쓴 글(검색)
	@Override
	public Map<String, Object> myPost(Map<String, Object> paramMap, int cp) {

		int postCount = dao.postCount2(paramMap);

			System.out.println("postCount:" + postCount); // 잘 담김

		Pagination10 pagination10 = new Pagination10(postCount, cp);

			System.out.println("pagination:" + pagination10); // 잘 담김

		List<Board> myPostList = dao.selectMyPostList2(pagination10, paramMap); // Board의 5개 열 정보가 담긴 List 형태로 반환

		Map<String, Object> map = new HashMap<>(); // myPostList와 myPostPagination을 Map에 담아서 반환
		map.put("pagination", pagination10);
		map.put("myPostList", myPostList);

		System.out.println("map:      " + map);

		return map;
	}
	

	

	
	
}
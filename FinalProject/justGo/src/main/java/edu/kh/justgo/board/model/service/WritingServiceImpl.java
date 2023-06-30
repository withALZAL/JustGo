package edu.kh.justgo.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.justgo.board.model.dao.WritingDAO;
import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.common.utility.Util;

@Service
public class WritingServiceImpl implements WritingService {

	@Autowired
	private WritingDAO dao;

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board) {
		// XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));

		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		Matcher matcher = pattern.matcher(board.getBoardText());

		List<String> imgList = new ArrayList<String>(); // 정규표현식(이미지) 된 이미지를 List 로 묶음

		// String imgTag = null;

		while (matcher.find()) {
			String imgSrc = matcher.group(1); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
			imgList.add(imgSrc); // 묶어진 이미지를 추가
			
		}

		// 이미지 소스(src) 리스트 출력 (확인)
		for (String img : imgList) {
			System.out.println(img);
		}

		// System.out.println("imgTag" + imgTag);

		// 게시글 삽입
		int result = dao.boardInsert(board);

		// 이미지 정보 삽입
		for (String img : imgList) {
			
			
			Map<String, Object> imgMap = new HashMap<String, Object>(); // db에서 BOARD_IMG 테이블을 보고 들어갈 컬럼에 맞춰 코드 작성
																		// map 묶는 이유 => dao에서 sql로 보낼때 매개변수 하나밖에 못보내기 때문
			imgMap.put("boardNo", board.getBoardNo()); // 성공한 행의 개수 (boardNo) 추가
			imgMap.put("imgPath",img); 
			dao.insertImage(imgMap); // 이미지 정보를 추가하는 DAO 메서드 호출
		}

		return result;
	}

	// 게시글 수정 (자유/ 질문)
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingUpdate(Board board) {

		// 1. 게시글 제목/내용만 수정
		// 1) XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));

		// 2) DAO 호출
		int result = dao.writingUpdate(board);

		return result;
	}

	// 게시글 수정(여행)
	@Override
	public int writingUpdate2(Board board) {

		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));

		int result = dao.writingUpdate2(board);

		return result;
	}

	// 게시글 삭제(자유/질문)
	@Override
	public int writingDelete(Board board) {
		return dao.writingDelete(board);
	}

	// 게시글 삭제(여행)
	@Override
	public int wiritngDelete2(Board board) {
		return dao.writingDelete2(board);
	}

	// 이미지 삽입
	@Override
	public String imageUpload(MultipartFile file, String webPath, String filePath)
			throws IllegalStateException, IOException {

		// static 공부하기
		// static 영역에 할당된 정적메모리는 모든 객체가 공유하는 메모리라서 util에 있는 fileRename 메소드를 쓸수 있음
		// 업로드한 파일 이름 변경 
		// 왜? => 중복된 파일명을 피하거나 보안상의 이유로 실제 파일 이름을 숨기는 등의 목적으로 사용
		String rename = Util.fileRename(file.getOriginalFilename()); // 번경된 파일 이름을 rename 변수에 할당 한 후

		file.transferTo(new File(filePath + rename)); // 업로드된 파일을 실제 서버의 경로에 변경된 파일 이름을 저장

		System.out.println("webPath:" + webPath);
		System.out.println("rename:" + rename);

		return webPath + rename; // web 에서 접근가능한 파일 저장경로 + 변경된 이름 => 인터넷에  이미지의 경로을 치면 이미지가 나옴
	}

}

package edu.kh.justgo.board.model.service;



import java.io.File;
import java.io.IOException;

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
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle() ) );
		
		return dao.boardInsert(board);
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
	public String imageUpload(MultipartFile file, String webPath, String filePath) throws IllegalStateException, IOException {
		
		// static 공부하기
		// static 영역에 할당된 정적메모리는 모든 객체가 공유하는 메모리라서 util에 있는 fileRename 메소드를 쓸수 있음
		String rename =  Util.fileRename(file.getOriginalFilename());
		
		file.transferTo( new File(filePath + rename));  // 서버에 파일을 저장
	
		
		System.out.println("webPath:"+webPath);
		System.out.println("rename:"+rename);
		
		return webPath + rename;
	}

}

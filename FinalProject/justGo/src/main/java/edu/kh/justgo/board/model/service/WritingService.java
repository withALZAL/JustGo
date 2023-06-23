package edu.kh.justgo.board.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.justgo.board.model.dto.Board;

public interface WritingService {
	
	
	/** 게시글 삽입
	 * @param board
	 * @return boardNo
	 */
	int boardInsert(Board board);

	/** 게시글 수정 (자유/질문)
	 * @param board
	 * @return result 
	 */
	int writingUpdate(Board board);

	/** 게시글 수정(여행)
	 * @param board
	 * @return result
	 */
	int writingUpdate2(Board board);

	/** 게시글 삭제(자유/질문)
	 * @param board
	 * @return result
	 */
	int writingDelete(Board board);

	/** 게시글 삭제(여행)
	 * @param board
	 * @return result
	 */
	int wiritngDelete2(Board board);
	
	
	/** 이미지 등록
	 * @param file
	 * @param webPath
	 * @param filePath
	 * @return result
	 */
	String imageUpload(MultipartFile file, String webPath, String filePath) throws IllegalStateException, IOException;
	
	
	
}

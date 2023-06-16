package edu.kh.justgo.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.service.WritingService;
import edu.kh.justgo.member.model.dto.Member;

@SessionAttributes({"loginMember"})
@Controller
public class WritingController {
	
	@Autowired
	private WritingService service;
	
	
	// 1:1문의 쓰기 연결
	@GetMapping("/writing/writingQuestion")
	public String writingQuestion() {
		return "writing/writingQuestion";
	}
	
	// 글쓰기 연결
	@GetMapping("/writing/writingBoard")
	public String writingBoard() {
		return "board/writingBoard";
	}
	
	// 포스트 연결
	@GetMapping("/writing/post")
	public String post() {
		return "writing/post";
	}
	
	// 게시글 작성 
	   @PostMapping("/board/write")
	   public String boardInsert(
	         Board board 
	         ,@SessionAttribute("loginMember") Member loginMember
	         , RedirectAttributes ra
	         , HttpSession session
	         ) throws IllegalStateException, IOException{
	      
		   //  로그인한 회원 번호를 얻어와 board에 세팅
		   board.setMemberNo(loginMember.getMemberNo());
		   
		   
		  int boardNo = service.boardInsert(board);
		   
		  String message = null;
		  String path = "redirect:/";
		  
		  if(boardNo > 0) { // 성공 시			  
			  message = "게시글 등록 성공";
			  path += "board/" +  board.getBoardCode() + "/" + boardNo;
			  
		  }else {
			  message = "게시글 등록 실패.......";
			  path += "board/writingBoard"; // 게시글 쓰는 화면 
		  }
		  	
		  ra.addFlashAttribute("message", message);
		   
		  System.out.println(path);
		  
		   return path;
		   
	   } 
	   
	   
	
	

}

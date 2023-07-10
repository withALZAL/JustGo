package edu.kh.justgo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.board.model.dto.Reply;
import edu.kh.justgo.board.model.service.ReplyService;
import edu.kh.justgo.member.model.dto.Member;

@RestController
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	// 댓글 목록 조회
	@GetMapping(value="/comment",produces="application/json; charset=UTF-8")
	public List<Reply> select(@RequestParam("boardNo")int boardNo){
		return service.select(boardNo);
	}
	
	// 댓글 등록
	@PostMapping("/comment")
	public int insert(@RequestBody Reply reply) {
		
		return service.insert(reply);
	}
	
	// 댓글 삭제
	@DeleteMapping("/comment")
	public int delete(@RequestBody int replyNo) {
		
		return service.delete(replyNo);
	}
	
	// 댓글 수정
	@PutMapping("/comment")
	public int update(@RequestBody Reply reply) {
		
		return service.update(reply);
	}
	
	
}

package edu.kh.justgo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.justgo.board.model.dto.Reply;
import edu.kh.justgo.board.model.service.ReplyService;

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
	
}

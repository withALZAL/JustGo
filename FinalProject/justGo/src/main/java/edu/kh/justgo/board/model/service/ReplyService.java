package edu.kh.justgo.board.model.service;

import java.util.List;

import edu.kh.justgo.board.model.dto.Reply;

public interface ReplyService {

	List<Reply> select(int boardNo);

}

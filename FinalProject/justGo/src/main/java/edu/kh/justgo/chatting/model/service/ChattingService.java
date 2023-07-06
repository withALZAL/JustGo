package edu.kh.justgo.chatting.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.justgo.chatting.model.dto.Message;

public interface ChattingService {

	// 웹소켓
	int insertMessage(Message msg);

	// 메세지 리스트
	List<Message> selectMessage(Map<String, Object> paramMap);

}

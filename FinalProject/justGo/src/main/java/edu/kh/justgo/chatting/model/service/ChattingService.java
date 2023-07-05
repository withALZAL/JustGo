package edu.kh.justgo.chatting.model.service;

import edu.kh.justgo.chatting.model.dto.Message;

public interface ChattingService {

	// 웹소켓
	int insertMessage(Message msg);

}

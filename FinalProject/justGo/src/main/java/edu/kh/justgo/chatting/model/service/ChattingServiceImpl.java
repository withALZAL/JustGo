package edu.kh.justgo.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.chatting.model.dao.ChattingDAO;
import edu.kh.justgo.chatting.model.dto.Message;
import edu.kh.justgo.common.utility.Util;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDAO dao;

	/** 웹소켓
	 *
	 */
	@Override
	public int insertMessage(Message msg) {
		
		msg.setMsgContent(Util.XSSHandling(msg.getMsgContent()));
		
		return dao.insertMessage(msg);
	}

	
	// 메세지 리스트
	@Override
	public List<Message> selectMessage(Map<String, Object> paramMap) {
		
		List<Message> msgList = dao.selectMessage(Integer.parseInt(String.valueOf(paramMap.get("chattingNo")))) ;
		
		return msgList;
	}
	
	
	
}

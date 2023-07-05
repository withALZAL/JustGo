package edu.kh.justgo.chatting.model.service;

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
	
	
	
}

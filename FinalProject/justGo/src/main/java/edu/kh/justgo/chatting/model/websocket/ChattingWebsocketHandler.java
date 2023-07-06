package edu.kh.justgo.chatting.model.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import edu.kh.justgo.chatting.model.dto.Message;
import edu.kh.justgo.chatting.model.service.ChattingService;
import edu.kh.justgo.member.model.dto.Member;

public class ChattingWebsocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChattingService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("접속 : " + session.getId());
		sessions.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(message.getPayload());
		// Jackson에서 제공하는 객체
        // JSON String -> VO Object
        ObjectMapper objectMapper = new ObjectMapper();
        Message msg = objectMapper.readValue(message.getPayload(),Message.class);
        
        int result = service.insertMessage(msg);
        
        if(result > 0) {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
        	msg.setSendTime(sdf.format(new Date()));
        	
        	// 전역변수로 선언된 sessions에는 접속중인 모든 회원의 세션 정보가 담겨 있다
        	
        	for(WebSocketSession s : sessions) {
        		int chattingRoomNo = ((Member)s.getAttributes().get("loginMember")).getChattingNo();
        		
    			s.sendMessage(new TextMessage(new Gson().toJson(msg)));
        			
        	}
        	
        	
        }
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
	}
	
	
	
	

}

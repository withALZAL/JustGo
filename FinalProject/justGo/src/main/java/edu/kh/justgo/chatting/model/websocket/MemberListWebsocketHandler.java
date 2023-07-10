package edu.kh.justgo.chatting.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.kh.justgo.chatting.model.service.ChattingService;
import edu.kh.justgo.member.model.dto.Member;

public class MemberListWebsocketHandler extends TextWebSocketHandler {

	@Autowired
	private ChattingService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessions.add(session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		List<Member> memberList = service.loginMemberList();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String chattingMemberList = objectMapper.writeValueAsString(memberList);
		
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	}
	
	
	
	
}

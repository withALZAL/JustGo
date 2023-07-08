package edu.kh.justgo.alarm.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import edu.kh.justgo.alarm.model.dto.Alarm;
import edu.kh.justgo.alarm.model.service.AlarmService;

public class AlarmWebsocketHandler extends TextWebSocketHandler{
	
	@Autowired
	public AlarmService service;

	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

	// - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 클라이언트 웹소켓 연결을 요청하면 sessions에 
		// 클라이언트와의 전이중통신을 담당하는 객체 WebSocketSession을 추가
		sessions.add(session); // 웹소켓 통신을 요청한 클라이언트들의 정보가 쌓임
	
	}

	
	// - 클라이언트로부터 메세지가 도착하면 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// Payload : 통신 시 탑재된 데이터(메시지)
		
		System.out.println("전달 받은 내용 : " + message.getPayload());
		
		// Alarm 객체 생성 및 알람 내용 설정
		Alarm alarm = new Alarm();
        alarm.setAlarmContent(message.getPayload());
        
        // 알람 추가
        service.insertAlarm(alarm);
		
		
		
		// testSock으로 연결된 객체를 만든 클라이언트들(sessions)에게 전달받은 내용을 보냄
		for(WebSocketSession s : sessions) {
			s.sendMessage(message);
		}
		
	}

	
	// - 클라이언트와 연결이 종료되면 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// sessions에서 나간 클라이언트의 정보를 제거
		sessions.remove(session);
	
	}

}

package edu.kh.justgo.chatting.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Message {
	
	private int chattingNo; // 채팅방 번호
	private int msgNo; // 메세지번호
	private String msgContent; // 메세지 내용
	private String sendTime; // 보낸시간
	private int senderNo; // 보낸사람
	private int receiverNo; // 받은사람
	
	// join
	private String memberNickname; 
	private String profileImg; 

}

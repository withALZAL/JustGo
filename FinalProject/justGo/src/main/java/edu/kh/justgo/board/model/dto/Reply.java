package edu.kh.justgo.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성
@Setter
@Getter
@ToString
public class Reply {

	
	private int replyNo;
	
	private String replyContent;
	private String replyDate;
	private String updateDate;
	private String replyDelete;
	private int memberNo;
	private int boardNo;
	private int parentReplyNo;
	
	private String setAlarmReply;
	private String setAlarmLike;
	
	private String profileImage;
	private String memberNickname;
}

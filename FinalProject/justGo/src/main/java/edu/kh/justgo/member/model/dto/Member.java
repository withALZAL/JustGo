package edu.kh.justgo.member.model.dto;

import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private int memberRole;
	private String profileImg;
	private String enrollDate;
	private String disableDate;
	private String deleteDate;
	private String memberCondition;
	private String setAlarmReply;
	private String setAlarmLike;
	
	private Map<String, Object> memberPostList; // 상준이 사용
}

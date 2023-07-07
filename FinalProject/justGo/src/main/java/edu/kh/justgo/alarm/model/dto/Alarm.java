package edu.kh.justgo.alarm.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Alarm {
	
	
	private int alarmNo;
	private String alarmContent;
	private String alarmDate;
	private String alarmCheck;
	
	
	
	private int memberNo;
	private String memberNickname;
	private String managerNickname;
	
	

}

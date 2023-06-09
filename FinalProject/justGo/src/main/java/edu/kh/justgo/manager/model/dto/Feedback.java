package edu.kh.justgo.manager.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Feedback {
	
	// 1:1문의
	private int feedbackNo;
	private int memberNo;
	private int adminNo;
	private String feedbackTitle;
	private String feedbackText;
	private String feedbackDate;
	private String adminText;
	private String feedback_CF_FL;
	private String feedback_CF_Date;
	private String feedback_DEL_FL;

	private String memberNickname;
	private String managerNickname;
	
	

}

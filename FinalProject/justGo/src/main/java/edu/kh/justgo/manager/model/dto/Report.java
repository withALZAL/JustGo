package edu.kh.justgo.manager.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Report {
	
	
	// 신고
	private int reportNo;
	
	private int memberNo;
	private int boardNo;
	private int adminNo;
	
	private String reportCategory;
	private String reportDate;
	private String reprot_CF_FL;
	private String report_CF_Date;
	
	private String memberNickname;
	private String reportedNickname;
	private String boardTitle;
    private String boardDelete;
    private int countryNo;
    private int boardCode;
	
}

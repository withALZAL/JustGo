package edu.kh.justgo.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImage {
	private int imageNo;
	private String imagePath;
	private String imageReName;
	private int boardNo;
	private String imageOriginal;
	private int imageOrder;
	
}

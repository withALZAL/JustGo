package edu.kh.justgo.myPage.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class UpdateProfileImg {
	private String filePath;
	private String webPath;
	private String profileRename;
	private String fileName;
}

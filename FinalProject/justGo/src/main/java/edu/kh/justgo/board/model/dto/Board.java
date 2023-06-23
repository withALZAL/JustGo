package edu.kh.justgo.board.model.dto;

import java.util.List;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@Getter
@Setter
@ToString
public class Board {
    private int boardNo;
    private String boardTitle;
    private String boardText;
    private String createDate;
    private String boardUpdate;
    private int readCount;
    private int boardCode;
    private String boardDelete;
    
    private String thumbnail;
    
    // 서브쿼리
    private int commentCount; // 댓글 수 
    private int likeCount; // 좋아요 수 
    private String memberNickname;
    private int memberNo;
    private String profileImage;
    private int countryNo;
    private int tagNo;
    private String tagContent;
    private String boardName;
    private String countryName;
    
    
    
    // 이미지 목록
    private List<BoardImage> imageList;
    
    // 댓글 목록
    private List<Reply> replyList;
	

}

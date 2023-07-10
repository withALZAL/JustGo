package edu.kh.justgo.chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.chatting.model.dto.Message;
import edu.kh.justgo.member.model.dto.Member;

@Repository
public class ChattingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 웹소켓 
	 * @param msg
	 * @return
	 */
	public int insertMessage(Message msg) {
		
		return sqlSession.insert("chattingMapper.insertMessage", msg);
	}

	// 메세지 리스트
	public List<Message> selectMessage(int chattingNo) {
		
		return sqlSession.selectList("chattingMapper.selectMessageList", chattingNo);
	}

	public List<Member> loginMemberList() {
		
		return sqlSession.selectList("chattingMapper.loginMemberList");
	}

}

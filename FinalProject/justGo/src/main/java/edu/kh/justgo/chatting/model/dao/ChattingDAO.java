package edu.kh.justgo.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.chatting.model.dto.Message;

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

}

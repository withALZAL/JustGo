package edu.kh.justgo.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.manager.model.dto.Feedback;

@Repository
public class AskDAO {
	
	@Autowired
	public SqlSessionTemplate sql;

	/** 1:1문의 작성
	 * @param feedback
	 * @return result
	 */
	public int insertAsk(Feedback feedback) {
		
		int result = sql.update("askMapper.insertAsk", feedback);
		
		
		
		return result;
	}
	
	

}

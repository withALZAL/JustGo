package edu.kh.justgo.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Report;

@Repository
public class ManagerMainDAO {
	
	@Autowired
	public SqlSessionTemplate sql;
 
	/** 오늘 가입자수, 신규글 수, 댓글 수
	 * @return
	 */
	public Map<String, Integer> todaysCount() {
		return sql.selectOne("managerMainMapper.todaysCount");
	}

	/** 1:1문의 Count
	 * @return
	 */
	public Map<String, Integer> feedbackCount() {
		return sql.selectOne("managerMainMapper.feedbackCount");
	}

	/** 신고 Count
	 * @return
	 */
	public Map<String, Integer> reportCount() {
		return sql.selectOne("managerMainMapper.reportCount");
	}

	/** 최신글 List
	 * @return
	 */
	public List<Board> newPost() {
		return sql.selectList("managerMainMapper.newPost");
	}

	
	/** 신규문의 List
	 * @return
	 */
	public List<Feedback> newFeedback() {
		return sql.selectList("managerMainMapper.newFeedback");
	}
	
	
		

}

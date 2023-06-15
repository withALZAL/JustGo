package edu.kh.justgo.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.manager.model.dto.Feedback;
import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.manager.model.dto.Report;
import edu.kh.justgo.member.model.dto.Member;


@Repository
public class ManagerDAO {
	

	@Autowired
	private SqlSessionTemplate sql;

	
	/** 관리자를 제외한 회원수 조회
	 * @return result
	 */
	public int getMemberListCount() {
		return sql.selectOne("managerMapper.getMemberListCount");
	}
	
	
	
	/** 관리자를 제외한 회원목록 조회
	 * @param pagination
	 * @return list
	 */
	public List<Member> selectMemberList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sql.selectList("managerMapper.selectMemberList", null, rowBounds);
		
	}



	/** 1:1문의 수 조회
	 * @return result
	 */
	public int getAskListCount() {
		
		return sql.selectOne("managerMapper.getAskListCount");
	}



	/** 1:1문의 목록조회
	 * @param pagination
	 * @return list
	 */
	public List<Feedback> selectAskList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sql.selectList("managerMapper.selectAskList", null, rowBounds);
		
	}



	/** 신고 수 조회
	 * @return result
	 */
	public int getReportListCount() {
		
		return sql.selectOne("managerMapper.getReportListCount");
	}



	/** 신고목록 조회
	 * @param pagination
	 * @return list
	 */
	public List<Report> selectReportList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sql.selectList("managerMapper.selectReportList", null, rowBounds);
	}
	
	
	






	
	
	
	

}

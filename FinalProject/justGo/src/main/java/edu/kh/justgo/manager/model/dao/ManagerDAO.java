package edu.kh.justgo.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.board.model.dto.Board;
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
	 * @param memberPagination
	 * @return list
	 */
	public List<Member> selectMemberList(Pagination memberPagination) {
		
		int offset = (memberPagination.getCurrentPage() - 1 ) * memberPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, memberPagination.getLimit());
		return sql.selectList("managerMapper.selectMemberList", null, rowBounds);
		
	}



	/** 1:1문의 수 조회
	 * @return result
	 */
	public int getAskListCount() {
		
		return sql.selectOne("managerMapper.getAskListCount");
	}



	/** 1:1문의 목록조회
	 * @param askPagination
	 * @return list
	 */
	public List<Feedback> selectAskList(Pagination askPagination) {
		
		int offset = (askPagination.getCurrentPage()-1) * askPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, askPagination.getLimit());
		return sql.selectList("managerMapper.selectAskList", null, rowBounds);
		
	}



	/** 신고 수 조회
	 * @return result
	 */
	public int getReportListCount() {
		
		return sql.selectOne("managerMapper.getReportListCount");
	}



	/** 신고목록 조회
	 * @param reportPagination
	 * @return list
	 */
	public List<Report> selectReportList(Pagination reportPagination) {
		
		int offset = (reportPagination.getCurrentPage()-1) * reportPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, reportPagination.getLimit());
		return sql.selectList("managerMapper.selectReportList", null, rowBounds);
	}



	/** 회원별 글 목록 수 조회
	 * @return result
	 */
	public int getMemberPostCount(int memberNo) {
		
		return sql.selectOne("managerMapper.getMemberPostCount",memberNo);
	}






	/** 회원별 글 목록 조회
	 * @param memberPostPagination
	 * @param memberNo
	 * @return list
	 */
	public List<Board> selectMemberPostList(Pagination memberPostPagination, int memberNo) {
		int offset = (memberPostPagination.getCurrentPage()-1) * memberPostPagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, memberPostPagination.getLimit());
		return sql.selectList("managerMapper.selectMemberPostList", memberNo, rowBounds);
	}
	
	
	






	
	
	
	

}

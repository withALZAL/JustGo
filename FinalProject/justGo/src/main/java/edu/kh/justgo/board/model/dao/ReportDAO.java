package edu.kh.justgo.board.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.manager.model.dto.Report;


@Repository
public class ReportDAO {
	
	@Autowired
	public SqlSessionTemplate sql;

	/** 회원이 게시물 신고
	 * @param report
	 * @return
	 */
	public int reportBoard(Report report) {
		return sql.insert("reportMapper.reportBoard", report);
	}

	/** 로그인한 회원이 이미 신고한 게시물인지 확인
	 * @param report
	 * @return
	 */
	public int reportSelect(Report report) {
		return sql.selectOne("reportMapper.reportSelect", report);
	}

	

}

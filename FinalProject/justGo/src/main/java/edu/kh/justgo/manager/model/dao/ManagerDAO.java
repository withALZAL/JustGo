package edu.kh.justgo.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.manager.model.dto.Pagination;
import edu.kh.justgo.member.model.dto.Member;


@Repository
public class ManagerDAO {
	

	@Autowired
	private SqlSessionTemplate sql;

	
	public int getMemberListCount() {
		return sql.selectOne("managerMapper.getMemberListCount");
	}
	
	
	
	public List<Member> selectMemberList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sql.selectList("managerMapper.selectMemberList", null, rowBounds);
		
	}






	
	
	
	

}
